Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820023D6CDF
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265668; cv=none; b=oRroczebQVmVsiyXK60qN6Uzl6SRYBXfoHdlKQjEA5fpAdJiZi6+sUaFp3Alnna1xE0QxDgRlMXkVzh3drdpsg1BiODal3UgtH4w7qmIEelR2duxBIAINPD33xAHmvjAf4+WDmT0ohqCem01i+qhN5AY8/L1UEtmUXMXIDu8J9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265668; c=relaxed/simple;
	bh=EZaiKQ2Igewejr/mBgC2O2msXgfzgRjupf+kA1bz7Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r91bgDtHASLgvjP/FCmzHXnErc00IFndsyMR+Um/JxLgE8QW4A1dkm6/S6pwQXiwNs4MswFhawlzC5YjBDPtDdsSgHsjNA6FjPCJkjkVMQuR9LETFIzUx3DaKBwS7LMS7kW15YY5EsMgFg64R3U7cN/hJkIlf/jDu56OKlBVVzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAj8T0m8; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAj8T0m8"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1329507c387so568303c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2026 11:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778265667; x=1778870467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNHFxOPKssTiIkdcxNpnCuXp2DqdPiAAb46D1S13Dew=;
        b=QAj8T0m8errkfGu54SnXxEgn403EgURbX3giHC7Da77qJHu2N1u0wYWJh1ZIMCkG70
         JC7mn7z+dx0qp3a1FYnDCPPEitp08BLyakogoAuHh90i7FA+pkKaeFPTndmXA8EwNyB4
         QZx3nL7yZKXfydcfV//ILY2maQlTMmcHxOXKtwFd+2Btln9y4vZnQITMuAXO4iRsOHiE
         Qt1Q0Ftk6l+fDXGX2jKQmj+oqCVppw40OeU6oL91e5d6oU4AlebjMrudqq5n1MoJIUlz
         gBv2mLxnTOzaSfVWaYfa5KyDuD8WZzwcaRELhgutnX9p51O/pafLgmLeYAM1zBMQS3aq
         Vifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778265667; x=1778870467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNHFxOPKssTiIkdcxNpnCuXp2DqdPiAAb46D1S13Dew=;
        b=K1AGJ9OGcYCttvHpLTR1HleH5dZCQMwWVbkXe4RcvzCloNWggJg1SA3dh++u0mQu6F
         8oXHll+f4WZQmwPpZh6Zw7nXgdizhttfLdyUWgUOoHIGt6Zhr+XWiYryQCZRCB80eKdT
         gzNr+B8fDPqn2zS09+fSDf0A3uk/3XeWYU6v4Cl0PpaVdVKp2XQC6YHNPazipaNONHh3
         3n/Qs7Xi9frOhSG1Ggwq+s3yAmQU16J8izGZwspVoABjrqcZaFYogpS3oRi5mruRSq19
         M1zpsQsULCPuwClaJ2rCgfMScCcOPD4e44sLaCqkkqnQFPc3POU/+lowhRkbKBiq3blQ
         axGA==
X-Forwarded-Encrypted: i=1; AFNElJ9zEPwareWyb2W5xq430M9p4cA06d5hMP08+FPjvxY8JGX/2SOlR0nA1fw9HitrwzlSCHSz+7oOmmNR/OHA6nyx49pX@vger.kernel.org
X-Gm-Message-State: AOJu0YxUV7lpBI533rNC/5SXAJ/+2ffH6LXu7hxXna7VGnn5MQ78Rh8M
	vTDI5W2M3HJTKMAgWd0sobPzVowSuK8yMdaIaQV/VUsmBoJbCYV8/6XO
X-Gm-Gg: Acq92OEFEtoM1Rqez67sRb9Ver9xQF068wuRz1GpQZvQXbifiRGu1of6yf7mrLVQ0kf
	giYtgkNLRjUwCiR3adwTj+fwXy15sNPxoKiNOBeWYpUVTrcQzygnMFbR8zRqul7YVNAWH83MvpD
	6r+7yWuN+4dtfVGajsLhv+SAtNguRqNdKIEkCuq3in5S7hUcCTzSX38YeWh0uaAq4JZ0RSp/Pga
	ceZjVHxm/PDyG+liMGR1VxvH4Vb90zDN6fNuqJjB50UJ4yHOVtyTvAnEMX/Qfu/v7E6NxHxu5co
	UohIHG2eYTzjlKTguHTkyJdNy2wQYwmKvn1maUB5FqE+qGS17QF9sEohbxEOoNjkQx+slJX0hJr
	bai7z8Y2yGMKg/ZZxbngeyUXRVlmBmsSjh7E5ZvTWbsDiRU0wbtsQYHEFvn4QL9d78SLkjf9bvR
	P7uKysggizBcbx1b1Q2MU6SmSlDyqzZee90O2dMpVDV8d+5vXQxAJ8qBCS5nxO89xvzyj5Psva+
	gic
X-Received: by 2002:a05:7300:e60c:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-2f54ad72f58mr7379780eec.6.1778265666442;
        Fri, 08 May 2026 11:41:06 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm3365279eec.22.2026.05.08.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:41:06 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan curves/platform profile/tdp/battery limiting
Date: Fri,  8 May 2026 11:41:04 -0700
Message-ID: <20260508184104.623016-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>This draft patch series brings into parity the msi-wmi-platform driver with
>the MSI Center M Windows application for the MSI Claw (all models).
>Unfortunately, MSI Center M and this interface do not have a discovery API,
>necessitating the introduction of a quirk system.
>
>While this patch series is fully functional and tested, there are still
>some issues that need to be addressed:
>  - Armin notes we need to disable fan curve support by default and quirk
>    it as well, as it is not supported on all models. However, the way
>    PWM enable ops work, this makes it a bit difficult, so I would like
>    some suggestions on how to rework this.
>  - It turns out that to fully disable the fan curve, we have to restore
>    the default fan values. This is also what is done on the OEM software.
>    For this, the last patch in the series is used, which is a bit dirty.
>
>Sleep was tested with all values being preserved during S0iX (platform
>profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
>least for the Claw devices.
>
>For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
>his new high level interface is merged beforehand, we can use that instead.
>

Hi Antheas,

It seems this series is stalled for 3 days shy of a year now. I have an
interest in getting this across the finish line. Will you be continuing
development? If not, I will take what you've started here and finish out
the remaining nits, keeping your original attribution of course.

Cheers,
Derek

>Antheas Kapenekakis (8):
>  platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>  platform/x86: msi-wmi-platform: Add quirk system
>  platform/x86: msi-wmi-platform: Add platform profile through shift
>    mode
>  platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>    attributes
>  platform/x86: msi-wmi-platform: Add charge_threshold support
>  platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>  platform/x86: msi-wmi-platform: Update header text
>  platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
>    unload
>
>Armin Wolf (2):
>  platform/x86: msi-wmi-platform: Use input buffer for returning result
>  platform/x86: msi-wmi-platform: Add support for fan control
>
> .../wmi/devices/msi-wmi-platform.rst          |   26 +
> drivers/platform/x86/Kconfig                  |    3 +
> drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> 3 files changed, 1156 insertions(+), 54 deletions(-)
>
>
>base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
