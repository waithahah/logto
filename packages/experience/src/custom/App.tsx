const App = () => {
  return (
    <div
      style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        height: '100vh',
        flexDirection: 'column',
        fontFamily: 'sans-serif',
        backgroundColor: '#f5f5f7',
        color: '#1d1d1f',
      }}
    >
      <h1 style={{ fontSize: '2.5rem', marginBottom: '1rem' }}>自定义 UI (Source Code)</h1>
      <p style={{ fontSize: '1.1rem', color: '#86868b' }}>
        你已开启自定义 UI 源码开发。请编辑 <code>packages/experience/src/custom/App.tsx</code>{' '}
        编写你自己的登录界面。
      </p>
    </div>
  );
};

export default App;
