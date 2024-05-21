import { Injectable, InternalServerErrorException } from '@nestjs/common';
import axios from 'axios';
import { JokeResponseDto } from './types/JokeResponse.dto';
import { ThirdPartyResponseType } from './types/ThirdPartyResponse.dto';

@Injectable()
export class JokesService {
  async getRandomJoke(): Promise<JokeResponseDto> {
    try {
      const response = await axios.get<ThirdPartyResponseType>(
        'https://api.chucknorris.io/jokes/random',
      );
      return {
        joke: response.data.value,
      };
    } catch (error) {
      throw new InternalServerErrorException(
        'An error occurred while trying to get a random joke',
      );
    }
  }
}
