Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.184.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712160;
	b=20y6LoNXSIW3p8aDljpUMTD0mRVI8xQvGtw3YZFMZgKZLzdXEy3B2XhMKY/pDJBRC3ZA
	 ecX5utgSI8FmQySFRBUrj5gt2iT9bG7RL0f0prgiHcNNMwuM83NdCHl93AikOGAg46d/I
	 OAF23Fx9uKbpQcXwbpD/S3J0F0og0xH02RklTZ/g+HnReBc/Hetx5iR7RVhQRkJ8KnaHA
	 KQrO6VzzEy2MWQ2lBppH0tXljynIhPAYYyzmsVcs19LYQyANRuIKWBlggGi0OF9YM/s7e
	 Su5azBtwmJoFCmRbTEAaZ1WxHrOCheLfApfK2/xz47Xyr4o5ABrKLuwT7wlWW3Y9BdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712160;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=z27o2hYhRtc/NLOViTZRhFhj65ehWKuRmsTFOEaKiyA=;
	b=nc2KCheez29gIGJ0Up0O7n1kN40jsU4Z6WRpMDB18YgimQqkTo3ra4TC8dMFOm2//KQk
	 3cpGaRaeQhbUJBM1lih6DPIzlj7W6kgON4cjVRZc4V5Qgh3ZCS7YjWzea4uBfYdkjssvm
	 VMaD5rc1szfQ9WeACjjnd3Fxvkk9mbAqvDJGBew4RxUVAp1Z2GSWAuSEDWoDOY918h1vq
	 9SfOIddPnnUGDgS9X1Rfus9oYa9pxVXKF9FXBBlifDCyW9zb1+qdfXcITuFCoAwLE5Sm+
	 3kss216dynOmRTQEZgijGyIVwen9dBJRtLqb1P7CFxr4G82aFpOtl2w9W3DcdknUxOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b="ONw/Ya3M";
	arc=none smtp.remote-ip=87.98.184.141
Received: from 9.mo561.mail-out.ovh.net (9.mo561.mail-out.ovh.net [87.98.184.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C34606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 16:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C34606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=ONw/Ya3M
Received: from director4.ghost.mail-out.ovh.net (unknown [10.110.54.35])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4jb2jz4LJdz614k
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 16:55:51 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-c49s5 (unknown [10.109.254.117])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B1D9EC24D8;
	Thu, 26 Nov 2026 16:55:50 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-c49s5 with ESMTPSA
	id fCZzJJZkCGv3vxMAA1Fp+Q
	(envelope-from <michal.kopec@3mdeb.com>); Thu, 26 Nov 2026 16:55:50 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S004d1c673f1-c4a6-40ed-a2c8-8a72ca7d3cd7,
                    F5CB060995E4CE4D80B5E3FEA9AA6E8736934F39) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Thu, 26 Nov 2026 17:55:05 +0100
Message-ID: <20261126165506.2793034-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123105821.305527-4-filip.golas@3mdeb.com>
References: <20261123105821.305527-4-filip.golas@3mdeb.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 7248262129503608380
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFQ8MNoLoqpplLSr83fjO2mGQD2XB3Hgjq+1VtRI9G0aljE7ggtdxBkBKNaKFldEpyYMriSBEuzYAb281b53rqSzys2WLMakeTXNVsrkyrlZNCYNfx9RhI86jcMYASO9I3qHAvdIg9qRPRXX6kD4EBmmWwi6/7Ljv5Bk+AOA7VCkTRdLb7VfF/ocjgFVTK4YvG2QpqyKjApscwttQ8OhieRKBM2Cf5hh77EBZua6E0eavFbi7OFmXJdcPL1NgrQ6FjrcBOk+1B4Txx/v90gwRIiaHJ3gndlflo/edncHfgUn8hX7x4L61np+tu9gfm9y44x1ZiKTWt42DI8IBcS3n3ksEHCB/w8we7K4g5Mk1a1AHJD7+Bdsy6QlSbwFCIAshzlT6jNc0UhV/sM4wnfyHq6usl+WmPLb6Q5jdxLuPyMpR4Zn0ilkvcZWe0iMKnRzvldLNNQ7L8ylmrXxakQdPO8OyIGsWSzxPpvlT7FCKnHOmIZwkjVmId+0H0p6ZTgA0bLy4IzJHgBlc1z6kLnrxCJhO0f6+RZSws+3EWhFbsVhJke2vXSZcx1y3HtACTYVmgSVqTdRX8XtM5ZxBWHPwoAwHevhNVrCUOwH7xheOCxW6nRryOzQpIgBEtm6dL5oh8VGSpgfCrg7dfn87yQFeaVKI/VkpONH1JHFHvWSSYxKQ
DKIM-Signature: a=rsa-sha256; bh=z27o2hYhRtc/NLOViTZRhFhj65ehWKuRmsTFOEaKiyA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795712151; v=1;
 b=ONw/Ya3MuXcf5t2kv1GlvPpvUTC2skkXYtpADOAvpUe4psR2mtnx7S26T5Pn8bc4BBYJgxLb
 ePBq/ItFCi4dCApyL/ukCacLnlmMZYg4BOsZX1WPF+LPW3uzbygMkSeNlWuYgGkmedV2/tDhA0a
 Dw4Jlp23SojG1jSv4ryj5SUvmfNZlzz8lONucPmzXyQVLT0kpbQexu/GHGsScYTReeHFJHWdWf9
 PJexkMrGLBw1tEBJvMIbEsBfwoGnP8trvXePz0izsIU09FgKwqAS6sSRzl2Dco1a33UoLxJWicY
 f8EUgWSISfH+LJi1s4+fSAdWfDyxY9kup3/+O6noRxWZg==

On Mon, Nov 23, 2026 at 11:58:21AM +0100, Filip Gołaś wrote:

Hi Filip,

Thanks for the V2, a few comments below:

> @@ -78,6 +81,7 @@ struct dasharo_capability {
>
>  struct dasharo_data {
>       struct platform_device *pdev;
> +     struct mutex curve_lock;

The hwmon core already serializes the ->read()/->write() callbacks on
its own lock, and exports hwmon_lock()/hwmon_unlock() (plus a
guard(hwmon_lock)) for attributes in extra groups. Could we use that
instead of a private mutex? It would drop devm_mutex_init(), and it
would also serialize the curve attributes against pwmN_enable/pwmN,
which go through the core. The show callbacks currently take no lock
at all.

> +     val /= MILLIDEGREE_PER_DEGREE;

Nit: DIV_ROUND_CLOSEST() would be more usual for hwmon. Negative
values are already rejected above, so it's safe here.

> +#define DASHARO_POINT_ATTRS(ch, pt) \
> +     static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_temp, curve_point_temp, \
> +                                    (ch) - 1, (pt) - 1); \
> +     static SENSOR_DEVICE_ATTR_2_RW(pwm##ch##_auto_point##pt##_pwm, curve_point_pwm, \
> +                                    ch - 1, pt - 1)

The parentheses are inconsistent between the two lines; please use
(ch) - 1, (pt) - 1 in both.

> +DASHARO_POINT_ATTRS(1, 1);
> +DASHARO_POINT_ATTRS(1, 2);
> +DASHARO_POINT_ATTRS(1, 3);
> +DASHARO_POINT_ATTRS(1, 4);
> +DASHARO_POINT_ATTRS(2, 1);
> +DASHARO_POINT_ATTRS(2, 2);
> +DASHARO_POINT_ATTRS(2, 3);
> +DASHARO_POINT_ATTRS(2, 4);

The attributes only exist for pwm1 and pwm2, but the driver supports
up to 24 PWM channels. If firmware reports FAN_POINTS for a fan on
pwm3 or above, it silently gets no curve attributes. Please mention
this limit in the commit message, or generate the attributes for all
channels if that's not too much trouble.

Thanks,
Michał
