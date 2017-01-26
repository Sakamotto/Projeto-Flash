import { SistemaAlocacaoWebPage } from './app.po';

describe('sistema-alocacao-web App', function() {
  let page: SistemaAlocacaoWebPage;

  beforeEach(() => {
    page = new SistemaAlocacaoWebPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
