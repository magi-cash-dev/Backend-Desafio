import { Test, TestingModule } from '@nestjs/testing';
import axios from 'axios';
import { JokesService } from './jokes.service';

jest.mock('axios');

const mockedAxios = axios as jest.Mocked<typeof axios>;

describe('JokesService', () => {
  let service: JokesService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [JokesService],
    }).compile();

    service = module.get<JokesService>(JokesService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should get a random joke from external api', async () => {
    const mockedGet = mockedAxios.get.mockImplementation(() =>
      Promise.resolve({ data: { value: 'Teste' } }),
    );

    const serviceResponse = await service.getRandomJoke();

    expect(serviceResponse).toEqual({ joke: 'Teste' });
    expect(mockedGet).toHaveBeenCalledTimes(1);
  });

  it('should throw an error when external api call fails', async () => {
    mockedAxios.get.mockImplementation(() => Promise.reject(new Error()));

    await expect(service.getRandomJoke()).rejects.toThrow(
      'An error occurred while trying to get a random joke',
    );
  });
});
