Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A56368292
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557761; cv=none; b=pBXYmwYB5WF0W0crjwPQXiY8kLU49nVf35crfzp2FgTHJwOdQFU4kTF8ShlfaDIrJZR9pbB/Sa1ZPZJvwe6LZgJrtctj2odqAsT3C3XYrnCo8jTfvK4iTi4/ju16+1zo/QJNtKIrK8lHEw7lNoW/drhAekNmM8HQTGT9T4d1MKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557761; c=relaxed/simple;
	bh=7VFQUlIwTyQSeswC4e5704zf5JuB6NqZXcShNGskuRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qtbd+Vjw0xQqi7fNC7I54rNCVveDu7gQDEHWlwzjIXDrX0gdL8WGITGT7U6f73Ji3FJbOA/HbAWEx323xnGH2A+FqAwu/e2ignFuAX3Z4xU6kgjFCpO3hlC575fSc0oxMDsyTRvhS/KpLc8d+Y7vxSKl6l1HpGcfqDbpnxXUWvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mgY9XwMJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mgY9XwMJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b427cda88so4794817f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 05:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763557758; x=1764162558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS2r8yGhFU+NVi0aUTb2MZUABBX5vRYn6yEsupiAxus=;
        b=mgY9XwMJ3gLXD1qZ/VHmh4m/wA7s6zNWvwrHWHalk8xn9HS2Wvs5JXYUT+6ra76qNl
         Y1xFBKhrmwCIIBP5cwtU/Ls0Wllcq81GgTkf2I+tbAY12eoHhpeZ04wb8SZnv2r48cXH
         1v0gaJGQm7/tio8/GdONumtJOKo0u1KbnfCymIh5WQ9jtQW6eYPqZ+iV4xeliZvSFC88
         r+of48Jo4bNjefW3s3FC74FmLelmHHN7LCDS0WOG8JXO7Xr1Lbi9YH1qVt9MchDajcVb
         xQ5YshYX51KMW49VpHbBw+ZQOIgsBSc55h4v79twSqmzYwKd1LUxkc0FIHSvdP3SUCNC
         Rs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557758; x=1764162558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HS2r8yGhFU+NVi0aUTb2MZUABBX5vRYn6yEsupiAxus=;
        b=qMaMNpJlp4aCnE5kTBDDnO4mV+7t+cZVUQgl6xvYHjmc9+Em4AvxTtOXUKE+JciZar
         jjwJFIYM0n6pU0SwNu0hF+naX5PyCDhyfozPZHsYexLlL+A5bb+hHUzseTpywgX2x+yg
         XB9nDak5E+VeQ2+f38VQuAO7eHBlwoOgnzV7vSnJfpwl8eFN4kD5XB7Ui4NuL7WlQhG3
         y4aLwWAmSFQKYXxaNlMISz7GQI0x/sIMMyVWn0prLIM5vbiOnBW+iqHgJ4jFUnqVNB8V
         9LkTr4rZLK+fbEEFp35RChceAhD/0a4RMymbjThoRj/w37MCMj2zFEjRTjlyvJwewEV/
         a51Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOIvT3/D6FO+xQ2+Yvou9iTQzKUdDfQvpufoRWP+5t/FhCjMNVTiQeIQpFdSOIt7kM+TXomRaUPryA2SEXD6O1I961@vger.kernel.org
X-Gm-Message-State: AOJu0YwsuwrHaymPKNd0DQYTfRvse79L8Q7B0tzkdG9k9shV3ppQBuCC
	SHJbhztfOsKHPVCKClB2IncVmVJ/fmHH6Obt2BzzMB8mNbrl5j0dy+EO5qOE47FBRyY=
X-Gm-Gg: ASbGncsAvqO7pOqaC80QeEThHwNtuPrZ0EAyhJQyU5Tda9bP5NZB+nzS73L35d1qPe/
	/qCb822lKiQqq4hMMxBfoVpZXXVinzL9YEcCwfWdJsC/9WryR0+YVvbbadhuPnije4RoBcnd+Lg
	9hZmeSFBSORiQGGotcaF0g9XmFdWTwOVKjU/qoF0L19nTQyuMFLF3LWt6EpEqNC1JYahOpomGcD
	OpyoJlHTS/sY4FjDh4DlVTAPEWZL5JeiPSdlKxzdKNwEmmpyk5UZE/s6mffwSi6jt6At178QVEi
	hPv3frMllEBz91aImf1r4JLT/kSMc8fnubArk3BMBZ7Ut6+oJrs7FjevnhzMOB94RgK+KYOscLu
	RgIvbcq1/FrotmuDUXbktjg6ac6t/Ho7lF/PjEA3KcjoEEnoipB3aU7IgN0eoNoG47rTTo2WovD
	kUlrHqqmWTS47PXQ4=
X-Google-Smtp-Source: AGHT+IEm4UQAc2Ruu6jE507gIFifpPunKGuizCP2sX+vg9eBBGciCwz1YHEecUUUv4XvKADEh1hOZw==
X-Received: by 2002:a5d:5f47:0:b0:42b:39fb:e88f with SMTP id ffacd0b85a97d-42b59339016mr17941623f8f.23.1763557757779;
        Wed, 19 Nov 2025 05:09:17 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42c97745f79sm23835123f8f.23.2025.11.19.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Raag Jadav <raag.jadav@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Introduce Intel Elkhart Lake PSE I/O
Date: Wed, 19 Nov 2025 14:09:15 +0100
Message-ID: <176355775360.69344.220026529766026146.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112034040.457801-1-raag.jadav@intel.com>
References: <20251112034040.457801-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Nov 2025 09:10:09 +0530, Raag Jadav wrote:
> This series adds Intel Elkhart Lake PSE I/O driver which enumerates the
> PCI parent device and splits two child I/O devices (GPIO and Timed I/O
> which are available as a single PCI function through shared MMIO) to their
> respective I/O drivers.
> 
> In spirit, it is a continuation of PSE TIO series[1] which received
> objection from Greg for abusing platform device and has now been reworked
> to use auxiliary device instead.
> 
> [...]

Applied, thanks!

[1/2] platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
      https://git.kernel.org/brgl/linux/c/a0c83150eea5807dbedf786f55cd49b14af118a8
[2/2] gpio: elkhartlake: Convert to auxiliary driver
      https://git.kernel.org/brgl/linux/c/10c15296906952016a84e1e45d8dc361f35afbd8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
