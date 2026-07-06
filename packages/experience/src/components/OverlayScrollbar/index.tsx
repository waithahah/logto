import classNames from 'classnames';
import type { OverlayScrollbarsComponentProps } from 'overlayscrollbars-react';
import { OverlayScrollbarsComponent } from 'overlayscrollbars-react';
import { useTranslation } from 'react-i18next';

const OverlayScrollbar = ({ options, className, ...props }: OverlayScrollbarsComponentProps) => {
  const { i18n } = useTranslation();
  const isRtl = i18n.dir() === 'rtl';

  return (
    <OverlayScrollbarsComponent
      /* eslint-disable @typescript-eslint/no-explicit-any, no-restricted-syntax, @typescript-eslint/no-unsafe-assignment */
      options={
        (options === false || options === null
          ? options
          : { scrollbars: { autoHide: 'leave', autoHideDelay: 0 }, ...options }) as any
      }
      /* eslint-enable @typescript-eslint/no-explicit-any, no-restricted-syntax, @typescript-eslint/no-unsafe-assignment */
      {...props}
      className={classNames(className, isRtl && 'os-scrollbar-rtl')}
    />
  );
};

export default OverlayScrollbar;
