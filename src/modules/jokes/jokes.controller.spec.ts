import { InternalServerErrorException } from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import { JokesController } from './jokes.controller';
import { JokesService } from './jokes.service';

describe('JokesController', () => {
  let controller: JokesController;
  const jokesService = {
    getRandomJoke: jest
      .fn()
      .mockResolvedValueOnce({
        joke: 'Teste',
      })
      .mockRejectedValueOnce(new InternalServerErrorException('error')),
  };
  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [JokesController],
      providers: [
        {
          provide: JokesService,
          useValue: jokesService,
        },
      ],
    }).compile();

    controller = module.get<JokesController>(JokesController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  it('should get a random joke', async () => {
    const response = await controller.getRandomJoke();
    expect(response).toEqual({
      joke: 'Teste',
    });
  });

  it('should throw an error', async () => {
    expect(controller.getRandomJoke()).rejects.toThrow(`error`);
  });
});
