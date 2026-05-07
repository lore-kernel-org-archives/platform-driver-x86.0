Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CCE318EE6
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778191897; cv=pass; b=nqOEvaH0ZLwRRRe/UUkfO+tFIWZGnjD8usUxLV3z5tHcZD+njw16BdwDGjBgVdrgmjZMaFV9AfF9QtwRzgL6jNzqeUYhvyEg9SaXhiqxj5M4v+S9w4aN6Th4TzxD9yxKKhuCS3Rw8fHOCw0ztTzdqwUIUx0iHCJUcNL6C1rJY5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778191897; c=relaxed/simple;
	bh=jdUKOifzZ0/49UQNF63fX/GTOHzSFLOQBXKUlp4xA3Q=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=N093ljh8fXWPmPCx83wyYMV7Xo+r/fAmHqJnDBaFkLVHHaQAbNn7BXwvOaeQhnJqkOU5GzosU2eQDr/PvwxLENrvgAisMPrPC7Ma3TkF6uHUU24S9yrOl6aURW/xfTTdDUS1eXT7ykubQC9F4KjWiygv7zL/BDZiGrQkaXTRPdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyydptFW; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyydptFW"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a86bfb6068so59741e87.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 15:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778191894; cv=none;
        d=google.com; s=arc-20240605;
        b=gb3kIKdZzcrCE4ueUoCYiWkHSYKlIdIIIAsECYHYA9BqC/aR2qaNk2yB9CzbJoN0p0
         Tk+bia8z7WDMYpE4mE/A+y+XXfoTozRjWjgXOIIpB/Sqg24rcj+pO4vuzRcAcOsqPI+R
         p8Dy/pZMUFWS9T+qKPUSEn9f16O9KAIRTYkVehHOS1sJXlNwlAMBBjgLrzI+8c4zodo5
         eq9270pAUXZRS1bbaktdkLektYgphYWc2Od9XCELZHCTP50sxC7RR++rCQhK8EK9FHIw
         olqA4057wHlUNM80gT/G7/XmB24rI4t0dDwN0XzAQ/Oi5q9y3CGma4xzEcQtlaLvcV76
         9+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=egUGSfKDYB7edPjylIc29b9M+jVTc181kEJ/BwMYBDw=;
        fh=urHKMVgT23m9wKWMoF3AgVWCXE+Q4cdsEMqS66Xx8s4=;
        b=HpQytD4J/eaUaTp4gJhg8w14S1t6UodStSORS9K7LfccRJUCEr608Qem6w4Lk4vRyu
         U3XqoAz8PQz383bB5KMWWVNf+weWhqYuPRMaaop8oUWpj+E9ELMO4vVm0DFCJhXt/w2L
         pjHq3s/QAZlZkydOohbF1lLLV4ZOZyHs3zQNP8qSF7+Qfg+RiGu/H8Uu7iWwcLbIrACv
         Zi5WaKrXsTpzKO1NpO36fYWs+Wpej0t6hBInngc+qq/h7rTH3/ege7cxkmKccuVhEsyU
         06sHK/C+HDrJWU+YgUCFGDttrx1ElGcobz6MhetUudqqlcJ+H9xWmf783u2DUfwz6LAT
         GB8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778191894; x=1778796694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=egUGSfKDYB7edPjylIc29b9M+jVTc181kEJ/BwMYBDw=;
        b=CyydptFWq31y0hu8lz2JNzproIBIg/Vlk+CFCONe/suYcAUhC9iw0ZHQ/OvVoF4iVL
         8U91mpOuK3Hv4DfGaL6JJWrDF65k1Kq/5h/LmYeX81/+iAq9niObJQxiSJfaMRN6u9aw
         XexOOQ1qlRhTw9Fipl5WbBZiI7vSWjMD2n4VS0jpV8BkXfDnfVCGgL9KgLWEoHbhM8c3
         HdT4n3c72RC+P9aZiVIXbIRMuHncpPfLOdCjq4vp88UJ7Tks3ptTaKGcEW12qLfecTvt
         bcFlmvox26NmiN6GEiAvBvSOjVTI/cEuZo2RdbquJM5F5zc4iPeWoeTKVGQPkESSiB76
         IrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778191894; x=1778796694;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egUGSfKDYB7edPjylIc29b9M+jVTc181kEJ/BwMYBDw=;
        b=Dk/GDQARayjGw7iSzkWa2K9v6nYOeOH8EMKUqUHSPJlDd8cBvFwPdZ84tnirYIaxi1
         TsniIaNZEEq7UiC0wRBuIrYbvvo+2hMlf6d4N8sV0rKANpAP+6pF6FFncy8/CBeC/tYT
         diSpy7941sWSAdDSiS03MZtt0Ap/PEopql00l+7+EXy0Iat5qXTER5X6F1Fh47dZJ89u
         oZZlI5Fu6+r660/iY4LNfLLAIKn0adbblo5Wl2lvXOqiyfnMFdmXMNXmpWj/CSEEP8HR
         k4KRLNAfgGwyrm8HMd2UfWpVUdtGmMqcKOVTNjEiYHn+Of2Ylb4PE1Yh4Un3OCIrXFjt
         b+PA==
X-Gm-Message-State: AOJu0Yy12P1TcePTOnFT+rl5pomw0tpjCKFVusk0a16UQzqTRowBmOHc
	GN/I2ifXGGnXzMm2eC0D4RUXLXUdyb3QKBTu1lMw1xGAC3d3XaFuSzFOaYunIW908hLIlOk4iEy
	xWJeCJGerFOQuA1LUCBJZ1HAijqr17i58txkv8Nw=
X-Gm-Gg: AeBDiet0r/2e0QR65Jy+XvCjHfOGGP5k9ieHkYnsBGzNYBlhafdDi32lsdlgfX3+bQo
	gUKe/IF3glNw8fPH1DdsCbKS2Xy3CbEFJsxT+cfuqXWD9ElviokLq8krrvmDFvCcxHyJlaZD4im
	W02JGHlu/hi+txcpzsJgkwLL4qsysSZ05IN6g8HHYcnBfryx/zbPmDdGIlcOnWQFbUXeqUTOFFQ
	9sGn4Gg+n6hwrX77H0Ih/0DqkcKaUSCfhlOFtFbDkBflTlVD4hx4iHfh2TlXyfedubRt66mPLZz
	4sRJ6qih6/RU2xpVehjUEIP2A/QW/dFjH2ivk7GWxggzDuAC1VD0ZR40AR9ZDA1V4qohCz6Q6w=
	=
X-Received: by 2002:a05:6512:33c5:b0:5a8:98b7:b69a with SMTP id
 2adb3069b0e04-5a898b7ba03mr671269e87.1.1778191894025; Thu, 07 May 2026
 15:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Jes=C3=BAs_Alejandro_Cort=C3=A9s_Pandele?= <jcor.alejandro@gmail.com>
Date: Thu, 7 May 2026 23:11:21 +0100
X-Gm-Features: AVHnY4ItfQ6xmcHUS1IJ5Dsc0Brc8ps3p2FLlcU3Bv3QT8leAMcm4FNsUIWLwqU
Message-ID: <CAEosg6nUPu526uA1OWo8UnTAiieMpwi2gPojd-LJUJnXrArmDg@mail.gmail.com>
Subject: [BUG] Lenovo Legion Gen 10 (83NN) - GPU power limit hard-locked at
 35W (RTX 5070 Mobile)
To: platform-driver-x86@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting a power-limit regression/issue on the new Lenovo Legion Pro 5
16IRX10 (Board ID: 83NN) equipped with an RTX 5070 Mobile (Blackwell).

The Issue:
The GPU is hard-locked to a 35W power limit and the P4 performance state under
load. On Windows 11, the same hardware correctly hits its 115W TGP. Setting
/sys/firmware/acpi/platform_profile to "max-power" or "performance" has no
effect on the GPU power cap, although the choices are present.

Diagnostic Findings:
- nvidia-smi reports "GPU Shutdown T.Limit Temp" as -5C, suggesting a
  telemetry failure between the GSP firmware and the SBIOS.
- dmesg shows repeated failures from the PlatformRequestHandler:
  [    4.655061] NVRM: GPU0 ... failed to get target temp from SBIOS @
platform_request_handler_ctrl.c:2171
  [    4.655071] NVRM: GPU0 ... failed to get platform power mode from
SBIOS @ platform_request_handler_ctrl.c:2114

Connection to other Blackwell issues:
A similar issue was recently reported for HP Omen Blackwell laptops
(Board 8D41).
In that case, it was found that the WMI driver was failing to send
HPWMI_SET_GPU_THERMAL_MODES_QUERY (command 0x22) with ctgp_enable=1 and
ppab_enable=1, which is required to unlock the NvPCF power budget.

I suspect the ideapad-laptop or lenovo-wmi driver is similarly missing
the WMI "unlock" sequence for the 83NN board.

System Environment:
- Laptop: Lenovo Legion Pro 5 16IRX10 (Gen 10)
- Board: 83NN
- Kernel: 7.0.3-zen1-2-zen
- Driver: NVIDIA 595.71.05 (Open Kernel Modules)
- Community tools: LenovoLegionLinux (legion-laptop-dkms) does not
  currently support this device.

Full logs (nvidia-bug-report and acpidump):
https://gist.github.com/kenju-u/e2fe8b86e521f4c844799518b9757f9c

Please let me know if there are specific WMI queries or EC registers
you would like me to probe to help map the unlock sequence for this board.

Regards,
Kenju
