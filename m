Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525527;
	b=qe50PjByf5RZUp9PSzt3aYy8s6T7imPVmRtvnA21axYxeXz+qy+LlBTGm0xRsSGYhPCE
	 u5LZXn/0U+CM/5seaIv4nkPJTV5xJAebAOQPdRER/Lt2b1EO8022KybbLBY53gd3ds8Oh
	 uje3QcyvOFKhHC0m4OYV/sLThNTFhhJIyfj9YhuJzqwQozmRPoL2SlsbfSt+8Gf7x9Fmb
	 4SLZsBwv05fGzcP3tj3KpdhVLpIDYhqX8JMTkd19nN9RvLF59Iv96wIBf89j6Rw2JEZ9z
	 qdQVOrC6l5dHDfmRFCnWe5Zt0Gb03QAAlpcw+AXQrHiTQxq6qYtqHMNiLW10cRCyb1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=1fSkvm5OP0PEIuFbARo1EL9pn1CvUDlyi1JdnlX4EPM=;
	b=LKP+st7I1aiGWNM3eEl9q+RPB9Q8KF0ykmcBKxNrXbOHAwOt9QK5Gy8EO9rKPwW83XfL
	 iouX3mMn476J4ZuCvXjZjpN+SkH5YEALjutCS4kQLUUrDdx9dLeuQ0QlwKhJ6g6LBLeBO
	 ItZUN1TRfSIRYyp8urTQPQfE2AzQiIXnUBpcjWqxrrURelvgWSkLO3Y3APKM8kRgzN88h
	 tPuh8bXX7AGx2SAFtzBmJgXJUhCwOiNz96ocL8xPvE3pakIs91RWlRdv4tBCFyTSG0FGA
	 G6y8ZT+IrL9GNaWHDjfWeJ/Amc0Nr4/X295dCn5/mH9q4CR62JBCGVBpMtZtFI8kJcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q5I09lLB;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4102606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 13:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4102606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q5I09lLB
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so5115977a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 05:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795525524; x=1796130324; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1fSkvm5OP0PEIuFbARo1EL9pn1CvUDlyi1JdnlX4EPM=;
        b=Q5I09lLByp8GrAga+z61+5M+gvAlJ4pVvlpe2jvfzdMI2JQJMoATfFS5LS9ZPidGNG
         jvWAweA+jd8KhbSMzj8JNgWmrPoQ5lrScSGaamKRZp2hJQCxvHllSSzIfxwEsbWPVFXU
         lmdK2+4F6qqkNeLXGkpDfOmSbd4o5l5NC2wcTUepdRIAry9l+Jx1W7DtlRdDsFcSG20I
         pU/Q0/zdgU1SWjHx38yKkYYDu1dKBwlnJjXRgbPkOvFy9W13kzHN9N3zrAUpbCkJi0oX
         ivNHAKp2pnuBYc11PL+TcwnZiPE4MJ3KJxnnf11wUXRLGKg3/O7crwPnWEW6JTakoUTj
         1MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525524; x=1796130324;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1fSkvm5OP0PEIuFbARo1EL9pn1CvUDlyi1JdnlX4EPM=;
        b=sBWwZyPZHBnZsTpoRypKDtGyAmkTIsjJy8bUny5P8Thm1ky96JqpzhjD8GFf3C40cC
         GaQ0USEZDR3K1wISRdCWMdm2opKEZZUpa6GnHFbMX9wp3hQGIWUqb8/dW2Fowd6EAwXv
         uqbUwrKjjjs/DID846iw288y+BrCY+u6l/ejSy8diewCAkFSvk0+Tzx4qALaj/D7Sbga
         NGOGDHJJtB1Y70oPAsAAjuQNWdr364y0gSZVCTJNU3NB3wkrGVIGUrNC14bUcKlzaAKD
         lvhIbwJKZV3pEThTVjWV7BFl5sYH7VDzuK8LrRXoM8Nrl9Aq/uueCm5Me5fE3x0B0X+e
         nWoA==
X-Forwarded-Encrypted: i=1; AL+hErGpwKQPk0nETkvhI7ROp1Sjep+EeESa/wpq3MiI3xZsQe9lFCbIqoZsd9+RUDdKDXZUXoDKyAej66WU3CQbGG+BzReF@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Im0emNVefeGYwlAy7pftBSt9Xr70h+vwzLelW2zDtHVQUKnh
	0CgUmx01haxz1O+5FI0CBRBlVbvtkLHgHcy8DOxHr3ihg+/FCWz98XQBrUJw1wjsyfaBTBjn73V
	wSCUWOjA=
X-Gm-Gg: AZFdTZc+j3Zqmq2nzatMAPvTjhaO9WiBFvlaAlHgHFuQ2K9FWyt193cxlTDun7G+oKW
	8RYkVFHoqMKlqbyb7cluEAH4eMjiiPsVmQd+YWbrScC8F2rez5VHnDQTSbzME2PF/qSMhJQdNR0
	gPt1PfimyIYnFk0gEq6VEwvvktLJ1GBvpItV86b5LxCVfM95kJLkl7A2ixluKm6GpbHDTloWoyc
	wwtML//GzYU4gOOnCZnRB1vRmaC9FeMUDHQI88tYZzGEkfVB5QotSSdfAcwbHxOHbSA/9PFE1fs
	8Z+nzEKCEhBTG3yP7EZC0elRWPsoCkS94gy82yRBqmwpnzwhgpNvJ+4UzywiherH4j4NCU9xKyp
	v/RZfASf0ygqMHknVBy/O0w+3JYtRg8xJypXGS2uy2izPEUWSl0Ia0l2IlvdC0UUKaaJq7SgQJm
	lbt4dRpD+1YjVV4gE4eJB4mupQ7yo7dTg6UMDEt7Gs4e7/1LtmDx03V3m/wSD69Rar8lOl3UD06
	KSWv5pX4iNbiGx99afqSthLsA6dNtR7z8QN2ajQ0/mjJzp/U1gWbXZnLyysFWeJC0SJSmU1ZrLD
	uACSW7GIudH96W/oJvO+68DjeHpan4xz0FjMbRyTbLsPc1zaoVu9l09bRMOhexD4R/T/x9coDHh
	ud7MnAcwOsHew/aUyISZh0wyZyPcSqbdqtPp1OJuwH/v9KezY0s4=
X-Received: by 2002:a05:6402:3645:b0:6ba:c85e:c0e0 with SMTP id 4fb4d7f45d1cf-6bac85ec268mr3910962a12.28.1795525524131;
        Tue, 24 Nov 2026 05:05:24 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm6784029a12.9.2026.11.24.05.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:05:23 -0800 (PST)
Message-ID: <59d4ee28-0605-4e93-8ac1-19c8d0272bee@suse.com>
Date: Tue, 24 Nov 2026 14:05:22 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] msr: replace rdmsr()/wrmsr() in comments
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-hwmon@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj.linux@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20261124064108.2440277-1-jgross@suse.com>
 <awWHd9ygPFipisb3@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <awWHd9ygPFipisb3@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fzIBNZKANk2e40IQjwqLyzcB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fzIBNZKANk2e40IQjwqLyzcB
Content-Type: multipart/mixed; boundary="------------eO6WT9kL6g4GOfnRabTN4O78";
 protected-headers="v1"; hp="clear"
Message-ID: <59d4ee28-0605-4e93-8ac1-19c8d0272bee@suse.com>
Date: Tue, 24 Nov 2026 14:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] msr: replace rdmsr()/wrmsr() in comments
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-hwmon@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Guenter Roeck <linux@roeck-us.net>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj.linux@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20261124064108.2440277-1-jgross@suse.com>
 <awWHd9ygPFipisb3@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <awWHd9ygPFipisb3@gmail.com>

--------------eO6WT9kL6g4GOfnRabTN4O78
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMTEuMjYgMTM6NDcsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IFJlcGxhY2UgYWxsIG1l
bnRpb25pbmcgb2YgcmRtc3IoKSBhbmQgd3Jtc3IoKSBpbiBjb21tZW50cyB3aXRoDQo+PiBy
ZG1zcnEoKSBhbmQgd3Jtc3JxKCksIGFzIHRoZSBmb3JtZXIgZnVuY3Rpb25zIGFyZSBubyBs
b25nZXINCj4+IGV4aXN0aW5nLg0KPj4NCj4+IEluIGRyaXZlcnMvaHdtb24vY29yZXRlbXAu
YyBkcm9wIG1lbnRpb25pbmcgcmRtc3Ivd3Jtc3IsIGFzIHRoZQ0KPj4gY29tbWVudCB3YXMg
aW5jb3JyZWN0IGluIHRoaXMgcmVnYXJkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVG8gYmUgYXBwbGllZCBv
biB0b3Agb2YgY3VycmVudCBjb3JlL21zciBicmFuY2ggb2YgdGhlIHRpcCB0cmVlLg0KPj4g
VjI6DQo+PiAtIGRyb3AgY29tbWVudCBpbiBkcml2ZXJzL2h3bW9uL2NvcmV0ZW1wLmMgKEFz
YWYgTnVyaSBCZXJ0aXpsaW9nbHUpDQo+PiAtLS0NCj4+ICAgRG9jdW1lbnRhdGlvbi9hcmNo
L3g4Ni9taWNyb2NvZGUucnN0ICB8IDIgKy0NCj4+ICAgYXJjaC94ODYvZXZlbnRzL2FtZC9p
YnMuYyAgICAgICAgICAgICB8IDIgKy0NCj4+ICAgYXJjaC94ODYvZXZlbnRzL2ludGVsL2Nv
cmUuYyAgICAgICAgICB8IDIgKy0NCj4+ICAgYXJjaC94ODYvZXZlbnRzL2ludGVsL2xici5j
ICAgICAgICAgICB8IDYgKysrLS0tDQo+PiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NoYXJl
ZC9tc3IuaCAgICAgfCAyICstDQo+PiAgIGFyY2gveDg2L2tlcm5lbC9jcHUvZmVhdF9jdGwu
YyAgICAgICAgfCAyICstDQo+PiAgIGRyaXZlcnMvaHdtb24vY29yZXRlbXAuYyAgICAgICAg
ICAgICAgfCAzICstLQ0KPj4gICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pZnMvbG9h
ZC5jIHwgNSArKystLQ0KPj4gICA4IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gWWVhaCwgc28gSSd2ZSBhbHJlYWR5IGFwcGxpZWQg
LXYxIHdpdGhvdXQgdGhlIGNvcmV0ZW1wLmMgYml0cywNCj4gaWUuIGp1c3QgdGhlIG1lY2hh
bmljYWwgcmVuYW1lcy4NCj4gDQo+IE1pbmQgc2VuZGluZyB0aGUgY29yZXRlbXAuYyBwYXJ0
IGFzIGEgc3RhbmRhbG9uZSBwYXRjaCwgd2l0aA0KPiBBc2FmIE51cmkgQmVydGl6bGlvxJ9s
dSdzIChwcmVzdW1lZCkgQWNrZWQtYnk/DQo+IA0KDQpJJ2xsIGp1c3QgZ28gd2l0aCBoaXMg
IlN1Z2dlc3RlZC1ieToiDQoNCg0KSnVlcmdlbg0KDQo=

--------------eO6WT9kL6g4GOfnRabTN4O78--

--------------fzIBNZKANk2e40IQjwqLyzcB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmsFi5MFAwAAAAAACgkQsN6d1ii/Ey/z
ZAgAisD+DZAdNXgjnVdM3s2bM/G2CpMIMc5aSo46KHC0SSFWxqgAn0uhLwg6oV0HfEM4WXejTWZ4
EPP6mOPAZTe1Y4she3H0RVq9qe7OAi2Rn3YM5XbKYmsxBf1dLD+xOmgZtSrVKA53/tvzcF6CriaX
w/KdLsxB0ASxzQIvaBez16RFmGVZ+veCA7XSqlfjCSvT7Ir6NTNPfbt/MixiHLfp+RMEBYG+gHzg
SSvjqAx7UG7fvGOt1cA1zW8ETewsqo+MpGIDVocuH5M5pF/kk0470EkP7An2N/FRvf296caLYPpy
LI550rDXjx1h/XL2gRPjKEKSJ4WJ4qz032FTkhwbDA==
=wTmJ
-----END PGP SIGNATURE-----

--------------fzIBNZKANk2e40IQjwqLyzcB--
