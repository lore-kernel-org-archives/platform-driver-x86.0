Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqNwbVlm"
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FA010E
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 Dec 2023 18:03:06 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50be8ced3ddso1474002e87.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 Dec 2023 18:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701655384; x=1702260184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqWyck20cDBBqys7ex+djsjdXdDHAZm2aFpyswHTisk=;
        b=ZqNwbVlm2kLUON2ruW3+bAGbtlvbahN2KURWieHKr8KKLxlsw9aGdGRHNNTK47X9uv
         S1BlTxnXJfG2aNbWhf1apdEq6ZS51r8UA85SgzMlXexcYdcgwyp9KFb9QgO6wCGfUJZi
         1DtkAOyPb1jV9MpYyzrlNcC856rQF4NfZtVpFnUsemwxrsQyVD+drQL+xcsPxn92VcgV
         zO5Ui3uNGR2taXb8EvmX/zjsW2NNKDHorek9/2vA+lbIdSGoukzPfE8W7JBLDCtw+xm9
         MsFc4XGTOM968Pd0IkPrBQhSxk3fI9rRhyL1W+hXhPoacfuxVqhRH5Z08jYMYzBtQXw1
         FP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701655384; x=1702260184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqWyck20cDBBqys7ex+djsjdXdDHAZm2aFpyswHTisk=;
        b=pJzxI++wzYnc2M0+eU4ZSBG/a8nY8T6s9HRYgD1vRSqqnu0gpPkCBq2Tt8ATO/j3DO
         bBnyU19WSnPUZAZnmdcRo8f31sTTTKp2jxwGjBMCO+aSQGjauLp9hCtRMugKNEwV4dP+
         D0JEKJICcooFDQURUZm1rm6mVMu0/FawhZhNy7Czq9v86G+KZGVyWew4YF2A9+RkDg5n
         jUQU4etF5wI1iwRWHOKz5tgCIxmINfHrSrJe5P/qR0OIl3P+2bbVlefdOwEiRqRnzjpW
         1ia4jRBPcau59Fi99mz1DsD8pEv1Po7+6ayzBirosKvD1CC6Q2kPSOQttj+rxZ7a7g9o
         3pQQ==
X-Gm-Message-State: AOJu0Yygk99r8tQf48ggEwZwE9bqML2nwxnXZvr7BgfV8j3OU6eAz1HV
	K9SgbP7sigM2TXI8ma1bBdheCA==
X-Google-Smtp-Source: AGHT+IHlf5cZZfyZCvGmTUr0UqBGf1nOu2Hl8bZCWwmidyxQGr+3+dIS9AyQUWz1vi/TQW4JbdMBYw==
X-Received: by 2002:a05:6512:24a:b0:50b:e4b4:d4f1 with SMTP id b10-20020a056512024a00b0050be4b4d4f1mr1330691lfo.87.1701655384258;
        Sun, 03 Dec 2023 18:03:04 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512348c00b0050bea5c2850sm525381lfr.39.2023.12.03.18.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 18:03:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Rob Herring" <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Andy Gross" <agross@kernel.org>,
	"Bjorn Andersson" <andersson@kernel.org>,
	"Konrad Dybcio" <konrad.dybcio@linaro.org>,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Mark Gross" <markgross@kernel.org>,
	"Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 0/3] dt-bindings: connector: usb: provide bindings for altmodes
Date: Mon,  4 Dec 2023 04:02:59 +0200
Message-ID: <20231204020303.2287338-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases we need a way to specify USB-C AltModes that can be
supportd on the particular USB-C connector. For example, x86 INT33FE
driver does this by populating fwnode properties internally. For the
Qualcomm Robotics RB5 platform (and several similar devices which use
Qualcomm PMIC TCPM) we have to put this information to the DT.

Provide the DT bindings for this kind of information and while we are at
it, change svid property to be 16-bit unsigned integer instead of a
simple u32.

NOTE: usage of u16 is not compatible with the recenty extended
qcom/qrb5165-rb5.dts DT file, but it is more logical since SVID is
16 bits wide.

Changes since v3:
- Added enum to constraint atmode SVID (Rob)
- Moved additionaPropperties to come beore the property definitions
  (Rob)

Changes since v2:
- Inlined altmode definitions instead of having them under $defs (Rob)
- Explicity list permitted AltMode names (currenty only displayport is
  allowed) (Rob)

Changes since v1:
- Added type:object and fixed 'description' string in the altmodes-list
  definition.

Dmitry Baryshkov (3):
  dt-bindings: connector: usb: add altmodes description
  usb: typec: change altmode SVID to u16 entry
  arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid

 .../bindings/connector/usb-connector.yaml     | 33 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
 drivers/usb/typec/class.c                     |  5 +--
 4 files changed, 38 insertions(+), 4 deletions(-)

-- 
2.42.0

