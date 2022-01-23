import React from 'react';
import { render, screen } from '@testing-library/react';
import App from './App';

test('renders first look at ', () => {
  render(<App />);
  const textElem = screen.getByText(/First look @/i);
  expect(textElem).toBeInTheDocument();
});
