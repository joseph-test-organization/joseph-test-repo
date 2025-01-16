import React, { useState } from "react";

const MysteryButton = () => {
  const [clickCount, setClickCount] = useState(0);
  const [hidden, setHidden] = useState(true);

  const messages = [
    "click for answer",
    "click harder",
    "even harder",
    "come on man that can't be all you got",
    "try again",
    "you really want to know huh?",
    "okay calm down I'll tell you. Just click me 100 more times"
  ];

  const handleClick = () => {
    if (clickCount >= 106) {
      return;
    }
    
    if (clickCount === 105) {
      setHidden(false);
    }

    setClickCount((prevCount) => prevCount + 1);
  };

  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      {hidden ? (
        <button onClick={handleClick} style={{ padding: "10px 20px", fontSize: "16px" }}>
          {clickCount < messages.length ? messages[clickCount] : `Clicks left: ${106 - clickCount}`}
        </button>
      ) : (
        <p style={{ fontSize: "20px", fontWeight: "bold" }}>His name is Steve.</p>
      )}
    </div>
  );
};

export default MysteryButton;
