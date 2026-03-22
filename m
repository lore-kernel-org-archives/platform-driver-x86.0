Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403482D12ED
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774196834; cv=none; b=sPzkb6udJW1IAYerFx1NXD1uaZ61g2IhrzYYZPaVZ+Pb29kcGq20ebRBPkBYSVJE914/PGUQdGq9+HTEYVtRRwlGyxAIG9yhKRh26yR8/P5gy3h8Y/Us452Avx8lHIugqw+1XJITgRs07XVJqpyuM6znA6xP9bS37rleVa+Ldqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774196834; c=relaxed/simple;
	bh=zelCPRPBiHIIQUKrtHqVMKa2Zuw2GB+0JE7ND9keZHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlTzEt9plF1GifKV/9YzsW4NG+/Fq24m08WI1xXo/eQXaeGsALchOdr3wukzDYYpFcrv9+5AybQcSCPNZIhoco8VOOhVblxBbIFSlqk+9ofkHL1BAzQ2cgfiMO/qw95W8uc5C+MgTdXe3PIRwn2dLN70WzWLJ8mSFyARo6w01KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1f1oBcm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1f1oBcm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35b98def50bso2449325a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774196832; x=1774801632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XXSqz0x59a7kSljMIN+JXfa1FnAzNfFzC0sh9FAJsgY=;
        b=g1f1oBcmh9E+vEG7roYK9wwTj5VCBeFUX/gk58VHRFpWnD/xevmfvA2p0Nf+PWIsPV
         NRDe78vBrfRrSIcre/SRj4UsFSP0oX2AwuppEwdFXU41/n5gjLygF9nS9lKjmOncqHqb
         aAoKPA6MQ0JtkDoznLSI4afH9nwNnYtTerYF0B201lCNlQJ7HYSIVIaCFo9N6kvP98j7
         4nNTKMMevuirDxddRgjlKn5DwGOLv7ewkZLsA0QqYUoxmy8IW6lWju9TUQzziUy6DYUb
         OXGIC+RwRP4vC2kIVHmKnaZrxk/BoRZM51zo0AD4UtXOUwxDT+E/bDRwc/gK+ZyLgyzx
         ID/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774196832; x=1774801632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXSqz0x59a7kSljMIN+JXfa1FnAzNfFzC0sh9FAJsgY=;
        b=qiQBLcBh3FnzTCJG994tm1oXaLbTXV9apoEc7P/PTZn725CJTv2fI2Ctpe5bJrp+d5
         /wKKuGDTJPQgMu1dP4LfGVILeUM/0wdP6qUfkdH/r3jDrJOOItywqarq0i2hLWRYsunt
         N8JWowfxwe+L09zDEoyWXMKXCMLVNpxqjfENs1QVDdqyFRQ3PBVpFpxYkGlFRNdRM8AK
         X2vCi6BelRpevpDuJRsMOW7FS+hGA64YaASeeyncE243vmlz/f9p/raG31u3eK0Uxq2R
         AL0k8UCrOuToYedx1/G585KyDKRvlP7JQgDCw4SmwrG+LK6tnqg8bl5di4wda6pZGb/x
         de/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUdJVqRsAaFRcdkZAzNRYibYepkGxstv7qk0h3oUhM3XMNqrQPvoVB8CxbFCDX2Onvi2rs9x7fwOk0c5zWGg0aFtu1@vger.kernel.org
X-Gm-Message-State: AOJu0YwjA2hA/z4HdZy3rQYW1QpAa+ikKFtzLTbTAbXOy14wsRySkgxe
	ZjMzeX7JaMYG5ME0tyCw+zzRFU8cnZLoe8Jw70b6b1hSH/laMugeSCuG
X-Gm-Gg: ATEYQzxti9TUmQS6/GNZHZLmwcMOHb7pDh6lVwQToObPdH3Rl0m+WBRO73jOBeB20Hv
	7HoyyeUpFw+j7y7fy3F61LCDX6OCwKk+XVcbDa0+reY9Xyq76Gh708bQ9p7KoDi753gGabxiFL3
	waF4BQ8YL3ET7WfaX4jFZ2VdHgSMUsKLFUMHSbUWAUyQohWQgH65726V/VlxcZpgkCcVMCSr+1o
	m9ADx7ziQRndmP3VMJoJWn0Ep2z5JVP1Cw/hl/+TdR4jO+aN8iKXY96dScrxlPt3ZdVxJcDXIDt
	zU1eeONlSRklfxc93Ai6vYE9mruBHz8qM0oQLenAOHsTzccdihG7BSNRK/CYwB9jVLr5ul94SyR
	8Jyw89c6qDWba1/XSpIWMUvfp+3aRmIdq2Ge4p5HyixDYQVAe4cV7Bx0ZKpBgCpHvVDrfq92KYx
	8naYFPPo4vzMJ0n2a0zv0JgD+yyq9vKVR1SLrAEzv3wPNOe44/+7qpTFP94yMvH9HEBz7a4OoZN
	aVQrjY+Gj8goa9g0ijQ
X-Received: by 2002:a17:90a:4ca6:b0:35b:e529:7089 with SMTP id 98e67ed59e1d1-35be5297a58mr1923223a91.10.1774196832461;
        Sun, 22 Mar 2026 09:27:12 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff6789sm10572167a91.1.2026.03.22.09.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:27:11 -0700 (PDT)
Date: Sun, 22 Mar 2026 21:57:07 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Emre Cecanpunar <emreleno@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/5] platform/x86: hp-wmi: fix bugs in Victus S fan
 control
Message-ID: <acASubvl9WZgwKge@archlinux>
References: <20260320235557.56298-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260320235557.56298-1-emreleno@gmail.com>

On Sat, Mar 21, 2026 at 02:55:52AM +0300, Emre Cecanpunar wrote:
>This series fixes five bugs in the hwmon fan control code added for
>HP Victus S laptops:
>
>- Return values from WMI calls were silently discarded in two paths
>  of hp_wmi_apply_fan_settings(), and the function's own return value
>  was ignored by both of its callers.
>- cancel_delayed_work_sync() was called from inside the work handler
>  it was trying to cancel, causing a potential deadlock.
>- schedule_delayed_work() does not reset a pending timer, so rapid
>  back-to-back fan updates did not extend the keep-alive window.
>- u8 arithmetic was used to compute a signed delta, producing silent
>  unsigned wrap-around on malformed firmware fan tables.
>- mode and pwm fields in hp_wmi_hwmon_priv were accessed from both
>  sysfs and workqueue context without any synchronisation.
>
>Patches are ordered so that each one applies cleanly on top of the
>previous. Patches 1-4 are independent fixes; patch 5 (locking) builds
>on patch 2 (cancel_delayed_work) to avoid a lock-ordering issue.
>
>Emre Cecanpunar (5):
>  platform/x86: hp-wmi: fix ignored return values in fan settings
>  platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
>  platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
>  platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
>  platform/x86: hp-wmi: add locking for concurrent hwmon access
>
> drivers/platform/x86/hp/hp-wmi.c | 59 ++++++++++++++++++++++----------
> 1 file changed, 41 insertions(+), 18 deletions(-)
>
>-- 
>2.53.0
>

Hi Emre,

Thank you for reviewing and catching these bugs. As this was my first
attempt with delayed workqueues, I appreciate the bug fixes, specially
regarding the deadlock.

I have tested this series on my hardware (board ID: 8C78) and can
confirm that the fans still behave correctly with the improvements.
