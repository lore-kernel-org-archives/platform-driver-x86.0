Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA031A571
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970372; cv=none; b=R2vT4sD8RhgW030BTzSsBQ8OZS9H7HZjPtcIHO9lOQ7GRN0K4i0x1oSVZdm4/9BneDSc3LMGkTpErQRpgs2W9wTIGSeejPxevQGG3g9ZXmBXjg47/WC61aP6THu1LBU2lNDQKUUXyCM5TDrjXFw4wTkb+OSCig1xLyj8jVcsbgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970372; c=relaxed/simple;
	bh=lz4sXla5iaXzYaYKO6dVoB67iPEdfhhgbRea96jUVA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=leGrKaj/1LlBsa5MRxHoofFtYV4mychkDurR9dzIWDY6kq2T1RrAhdQbb1G6doOk8cXBjIjbTiktoL+Yp0Lnt4tpNN6JydCe/WqYjzsbxg8h3vQfeAxcOqOeYFmf0M4RR9kmIjQtAfdisJ/K7su9BV3vLSUYMFavYUTVYknBsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clpZ+HhM; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clpZ+HhM"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba9d13f10eso1201349eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770970371; x=1771575171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNf3v4qpsTMWnVnNf0YVxXfe92u+FC0r54wXd3NTaBA=;
        b=clpZ+HhMhkDCXQA1EqFZ3Jp44kAzrvME6y4pA7cpEEmzc4LWO5o163dzTlhfPoFvPm
         tMmPNZoUauf8QQYlfhMBbiblLfhiP6LAMHDcHJV84IYf2avsvB/i179fB9FzwUvUMxog
         bxavk8GV3unxQujRvJdPuxWUV7260sq5B6jDKzNM3VDgu3ufW6fnxk1Q5ZBOXkwsuSex
         hFkYBcFEpUkJKXHvs2Ldcbm8CcPdeVAxTeEXLGS2CfPA2j1y29/0Bo5UlAhazAae6+b3
         GvR6jjo+ppPU1fOoSH8VGd2z+WXsLpUFztYiN+sRkJjj0v3LPYevV+DSvJbQJYG+gkPQ
         2AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970371; x=1771575171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNf3v4qpsTMWnVnNf0YVxXfe92u+FC0r54wXd3NTaBA=;
        b=SzZIeUSXohi1UETq3xxMWX5jfCzkQrBqad4BQB/MQ7OaCW3BIaYqZp9QxrGjmCb1hm
         Dsd/eZDh0EVU/oQulYmxuyRWzgC9NlDZoVJYG24q3Fe9EstKtuguoUl1CPelwt3wTqU+
         rGacsDFyKsnpHznKMKyOtrz/029J4cBYf2utac+c80TYIIi+09QOQWjWt36eaUy+XHjB
         Wt176VYndDubQAbvbO2RGlApbP0GNHocvdITC0z8kpJXA8oODYnRg2s3ElEMnPlqtft3
         f+SmpTxAbDWf/TBwFlb30NpsmeozHFUXKIEsVZ6CuBJIyRNg856TOJ1FjRoUP1LZtiTo
         /ejg==
X-Forwarded-Encrypted: i=1; AJvYcCXVqzKQbZ8/kGFdyv0+rEaPL5aON9+ID9YOnInBsZbi8jtvXgEUJiOLGJOzHaIVa2QCBp4rqQQz8amSAG/z5zzcNd0D@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Hiy5UZDXMlGKbRvo/3ZuEQYWLgtMYqbmmAeSRaIVOBD0OIDo
	kKzy8v12aNQrZLLytkeNSoLpnemHCpTcvS8NwUKLhGaPya8dKqmcuHtS
X-Gm-Gg: AZuq6aIUe5wprC+DniZvk/K2kt544u5xU9s7EEYNYbzK4SitR8pMronux7l+zgULdnz
	FL44pP2a1bqPd6hiyojzUrFlE5u9r0XXbvLKUUCcKYiLZ1FR4QAnqeJNynn7bh1MbzQ7BKPzU7Q
	Yd1xx6WBCX0V7wLw5TSLNOI3em1fpAaEzes/cKNaWX9hONaIE/Jrij6IAQHYKF/xP4ZVi1U+Itz
	emdZ860vkq2hfhFNcjrgBVo08dg7zTKhQ/GOcJ+UeZHQyxjcmKhVb/2XRO2whFa0cQB6Yq9r+VQ
	Y4Ip9XOX1KOev0T82PbewEPROHdtwDJmqBqGeztjrUAkX3hQicQ4H5bIFW7Felmw3rpXqgElRbY
	13OlKkyl+ZNoLOrFXi4IjlSeIYQsI1AvY6z0bLqZV1uTEbGUrkoDNBsGngOVKjR7XLqjOZYmCQN
	nHwKqI5PMc+32eo66GNC5NwoBZzBmbkmEoDeUps9TJ1aQRxWwCnPdJovNuC3ZnaBBhqwg5252Hh
	2c=
X-Received: by 2002:a05:7301:168e:b0:2b8:6573:2d35 with SMTP id 5a478bee46e88-2babc42e1f4mr473844eec.2.1770970370681;
        Fri, 13 Feb 2026 00:12:50 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd0a04csm4975052eec.33.2026.02.13.00.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:12:49 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Fri, 13 Feb 2026 08:02:52 +0000
Message-ID: <20260213081243.794288-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds many much needed features and fixes to the lenovo-wmi
drivers.

Patch 1 adds a macro to make assigning attribute ID's for capdata
cleaner and easier.
Patch 2 addresses a bug where devices that don't support exposed
attributes would still create the attribute, and also attempts to
identify the correct capdata and set/get methods as some legacy
interfaces don't use the custom mode in the method or capdata ID.
Patch 3 adds the remaining CPU attributes that weren't previously
exposed.
Patch 4 adds the GPU attributes that weren't previously exposed.
Patch 5 adds battery charge-type limiting when supported by WMI.

After applying Rong's series from
https://lore.kernel.org/platform-driver-x86/20260210191938.137234-1-i@rong.moe/
I found that there weren't any conflicts, so rather than combine
the series we can just review each separately.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Derek J. Clark (5):
  platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.

 .../wmi/devices/lenovo-wmi-other.rst          |  21 +
 drivers/platform/x86/lenovo/wmi-capdata.h     |  13 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 605 ++++++++++++++++--
 4 files changed, 591 insertions(+), 49 deletions(-)

-- 
2.52.0

