Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167BCEEA8
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 22:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795383; cv=none; b=vCZu90UsAtSWsTQQRgP/yi7mwQrVe2TD88wVjeO8BBh1sb49fxuBeBsGzN8/wjp5VrSMoPAcox6LFYM79Ath8Z8vL8clJYiH3OpWUcP9FfXtXswi+uEDw0cJS0iwER79E5RHtM2FUpspG4eFEUghLN2vH7x6J3i0/YF97CTR3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795383; c=relaxed/simple;
	bh=wRf7seLg/PtIoq4q0F63L6Ynk1VyW+y1eS+2VnsaHaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShoI7xmi93T4jvq0thk8DR95kL613khqG6JzrhTz/Mqmch3ycyfYhBKpK9pVpZMftAH/I0PAczReVZgXN57JHE28c/PREaTXtD75ulN8WIGoewjab7vw6GJ4blYMoGZsl4uElMaHHmpNN2qbyAGAjDDiSnvm2yM/h2mOgx1xtKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqWLP4sJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqWLP4sJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e08baf860so3425812a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 15:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795380; x=1786400180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+ei9qP/3pDlJdQw+OQB45Cnt4yPxyeAe4Q6yRcLbjU=;
        b=AqWLP4sJim/QpUe4htViXKmmyZHPquOohotTStayvneoJZNsvYRJ0bOzH7xJw1LiV8
         lxZrvqKLgNy78GgHXLX5PlAre+V53WciA//yn0Qbsn3I4DA/B0dpmY6NgDtWRhbnGrW6
         8N1vuQh73gl8d9sSKMuejTlNbh63PRPlhH7chKoouFPxBEU5Es0rKEn0w0ECSB473/+g
         OynkLBXArt0kW7eC9JPxjUqVLt2xZ/QsGxqBXQdP+4c52TvzA9gQuk7UXQlON0mlZUko
         ipxTLXnfABOol8A2oUl+YoDF0iLdeMiFlhnMdnrlAPMTBb8OF9/NxpftBKq9I1uFnaI3
         26Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795380; x=1786400180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+ei9qP/3pDlJdQw+OQB45Cnt4yPxyeAe4Q6yRcLbjU=;
        b=KRRZLiYLcnwvVT/tbfbCaqu3sAMJprLZABy+2cQiEd1CBzxcZtm56zCcoGvYQLgSad
         FzSp6XXMv0vK9STVoa1uVVu+9qPe15zHz5Dg0fp8J56giJU8iwkHQsXk8NDrMqNh0E9y
         48XisIgVsw6gUcvLCqBWLt0I6CJ0SCJRAmZd6rlfKI0Fpizo2ths1owuxBz4xkG32M7I
         lMmRjzfoyn24IX1GdScwrqiwt5vPwqldklofXqIXxpC5Pc2VZVEalBMpclAbn9xBHqof
         YtEsg1jfW/vOyZJVqTZnsfYLmQC8on17LfTYoo5fDB9divwaziew23Tvy5sAZVqO/LW5
         7A2A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5vy0iBTNcwY0H1FvszQmFximVFeT0gc0r4RR9+Ct4W2ST/QHQtNwpOl08FW6OuhFATkeiahs1Inkn63gKnoeKA7QR@vger.kernel.org
X-Gm-Message-State: AOJu0YwG63Nirz0WmKImU+Jf9LCYZUOd4eUi5NHV1R7xF7IQaafwCjkR
	+2gsFAY7HOK6jvRpeqrK4DfDIfl73nechXJJRwqDPoF61Vq6dhT7X9HN
X-Gm-Gg: AR+sD10i+UaohBr7488F1wIKdefRZWPrLK2RaWF5xCQkkqgzoKjV64d/tt1NTk/ABEr
	3M/9ckp/O7gzQ4Hbix1Tkw/mTkch9LqurFJ/EzL5meLUJKSoBICiKbFn2EIM0A+eOrGqbkLfdj7
	MskmlJnrD0ZWShzczQu/kd1gRTOycO3PfAL3ZmyQGRLOVmQuaRHwlx/3JSFXTXWwVvTPGGXkTix
	E8TPWqZCaFCzqkrDeP56jhmrozBREm66lKpKRm3rVJlTslciryfU/SgTlTybXXp1JLK/mCANTNo
	7S5mMV1kxhPTqeK1DSiAoN2nRgKDtcwu3hSypSAx5q4NsNBVVPAQT/jVN/HHD3VccFXd8+6hbtn
	o/NjEjJvN7UrXYCtn/uSN6YD8exEzpSth1QwAZIPI+PSIc2VP8PCX4Fg6WhCVa6gQhLlmoZSz+8
	bkTSOtQ4UxlARpdW4bdFGFPR2yVXV3Kjzx9z/B8Blcdod9MQTEmh5wy885o088axyGu0JkzHvzV
	Tjvhx8HNGzy/FNsPCKLKcqFMf//AwTO24fdBc7KNw==
X-Received: by 2002:a17:90b:3852:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-38fbc46d032mr9505429a91.16.1785795380404;
        Mon, 03 Aug 2026 15:16:20 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:19 -0700 (PDT)
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
	platform-driver-x86@vger.kernel.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH 0/6] Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan curves/platform profile/tdp/battery limiting
Date: Mon,  3 Aug 2026 15:16:08 -0700
Message-ID: <20260803221614.59324-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While tesing this series, multiple issues were found that cause crashes
or compilation warnings. Additionally, since this was first posted, two
new models have been added that each have a unique feature that must be
managed before TDP control will be used. Given that Antheas indicated he
still plans on sending a v2, I'm posting these so they can be
incorporated in the next version, and so that distro's packaing this out
of tree can get the fixes and additional functionality in the meantime.

A summary of the changes are as follows:

- Patch 1 detangles a guard with a switch case that violates cleanup
  rules.
- Patch 2 removes an unused err variable.
- Patch 3 teminates the quirk table with a null entry to prevent
  unquirked platforms from crashing when the driver is loaded.
- Patch 4 cleans up the device quirk names, fixes a bug with when buffer
  data is copied as a payload, and adds separate PLx limits as indicated
  by the windows DLL, if pl1 and pl2 are set to the same minumum it can
  cause instability.
- Patch 5 adds support for gen 3, the AMD Strixx version. In order for
  manual TDP control to funciton the STAPM flag must be toggled off.
- Patch 6 adds support for the 8 EX Ai+. This device uses a new shift
  mode, called "manual", to enable TDP adjustment. Since this could
  conflict with the existing "user" mode, use the quirk table to
  specifiy which mode is "custom". As a consequence, "custom" must be
  checked outside of the switch case as it could be one of multiple
  values.

If you incorporate any of these changes in v2, please add the
appropriate attribution.

Thanks,
Derek

Derek J. Clark (5):
  platform/x86: msi-wmi-platform: Move guard out of switch in
    platform_write()
  platform/x86: msi-wmi-platform: fix: Remove unused err
  platform/x86: msi-wmi-platform: Clean up devices
  platform/x86: wmi-msi-platform: Add MSI Claw A8 support
  platform-x86: msi-wmi-platform: Add Gen 4 device

Matthew Schwartz (1):
  platform/x86: msi-wmi-platform: terminate msi_quirks DMI table

 drivers/platform/x86/msi-wmi-platform.c | 151 ++++++++++++++++++++----
 1 file changed, 127 insertions(+), 24 deletions(-)

-- 
2.55.0

