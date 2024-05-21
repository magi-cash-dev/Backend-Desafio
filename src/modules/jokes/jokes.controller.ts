import { Controller, Get, Inject } from '@nestjs/common';
import { JokesService } from './jokes.service';

@Controller()
export class JokesController {
  @Inject()
  private readonly jokesService: JokesService;

  @Get('random-joke')
  async getRandomJoke() {
    return this.jokesService.getRandomJoke();
  }
}
