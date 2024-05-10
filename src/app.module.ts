import { Module } from '@nestjs/common';
import { JokesModule } from './modules/jokes/jokes.module';

@Module({
  imports: [JokesModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
