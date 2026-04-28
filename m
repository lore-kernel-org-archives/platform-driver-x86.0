Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874A244104F
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777385426; cv=none; b=cFMnj9zzVzi7VdGy4s/R8yDpeYtwhc5huZSL0PZzzwNYEHP+ASQrwhsUMOQ8WxKIV2ElPTjXYFCoTQkcMwy/2TwT1H/VKThTqGZhpDUq3zMuQ4ftPvpOkLSrFL958fVoEyUeSvDAHBD1pehKRagGcvHj88CSlNDTi+fOPTC9Y7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777385426; c=relaxed/simple;
	bh=VVaBU0wqcGR7DB0/rzF91LQLvMxBcV3vG/TP2ffoPuo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=pVla8WHSaj9241NHXPx+pPOpIXEtUmChFLtbptCqMO/mPPCGLOJWwDX/UBm3iGXIkQ3tRavARsimQd1K8izavQ9z/cKlqtB2SSIdFSaJ6X3IV9AYciLTsFYJeJpDIufnU42BSp+GxVYucrXPnjxs4RoXGAsd7roYytzuT7j/esQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNam56X3; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNam56X3"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6201fc9ac0eso2150216137.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777385424; x=1777990224; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZUgbXBy5wBU0wEHjVuwR+E12s+n3IKckzY0lsaTI+s=;
        b=mNam56X3FSG++AMyjh3P9mL027rms4VH+rtKzO6o8CvbRO0y+gc44JrqUNzFezxbn1
         VsxQHO85RqrB4lu712dI3zYydNi3gTdfdDDfvJpoQnaXc1fKGVrcro51OQhkiukz6L0P
         J2Yv8vy4adIuwRaslwOTyZ1v5/MpLFRI3t0CmGQlsU5lfBsCk+Le5V2ThfEiGkilMa89
         ZlzjinpKNd1sIYOQYGm9Y/xxC/rvVEup1D0jHmcowG1oI798fZj2X70ul0J8BDQBimnH
         wgvohqTJNTMrzw7xbPTZyvy8hbTR/7KlosJ0yfKpqRLztc5lF9rqjIytmDZHnO/cwR+h
         AzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777385424; x=1777990224;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZUgbXBy5wBU0wEHjVuwR+E12s+n3IKckzY0lsaTI+s=;
        b=C8jEIdirNzOOiITEom821y4Gw/o4UeKdi8yUrkNsSwRetKvmMj6+eahFkewMBzOxFl
         X945GZUj5HHSG0T1AH98QE3Xku9uSRNk+YEa/A3KO8E5i4hBewjrxDh9SH0xhBP1LjII
         +waRseqZIcLvYskh8tzavXHf0b/E03NE0/QjriWRSh2Kg7WjVLLmhiB6ST7W34VfNk0s
         kMSnFckJ59O9EoLO6fA89q2aih93m2tvB3KV7pgzwFOrAE/PeNoKX6M3/RwIaEocduKo
         Pg9RPuMRB8AcRJjdnyBfVaTPodYBD2q+w7x9BnguloIYfg8TKfIh/WG+ITVDQJ2O6Bm0
         mMDA==
X-Forwarded-Encrypted: i=1; AFNElJ9of880MbL4ow97UF0VULCq51W6NCwK+WQNvI+DCO1MyZTrF/n88LMgkRevrKog4sq+mIWKHjuvRqMpPgCfDYXhlYcP@vger.kernel.org
X-Gm-Message-State: AOJu0YzedZRNGnq4IvxtJPzGLUvf9PJ9ZvXf7LH2B8MrVOM/6TR/z7GM
	4oM4yo2rwE7TxYPVVzVULn6FWzlAq9xDRJX3TtnX8ENshhSZnpQaS5UN
X-Gm-Gg: AeBDieu64GSnj+2b/Yi1RKJFj/+5yfuGUFRkZ2mLHlOPsgOnu4VQAGoTV20/SvMV9ax
	j1Xo7qhWUKI6Rw6D+JF/vWugMQNtWBTfZqVxZ1f5QD+2QVJWYV1AzgTrYlTfurm9vOtjtyv/wQF
	7PGGtZogcpZ3gFVStBWMNAbn2aLfWbRrhna4Vdza51u5Yjlt57i/qU7w5XzVXPltogcLqHDaZDE
	A2BHEpb46dlqZKVeutzpJgT2yBAOpkIKr6mliH5Vjg7XedEIYnV+SM/nU80le0BwEPBJ64gj5Sq
	S6oeiDesDrNCQnaannQK6Rre3Op6DOECuu78t4f8gEu32cU3aySc5eY/s/TcAQ7jFP75HutEMv0
	XtmTuNl0jh6Kuf6rZMW2CE7QAyP4aYlsPmeD2wZNvsK5xRf0EoPJYNDDdySFqyZhuo96W504yqV
	RGbePMdtyp9wyc8ouM1sNCXleB
X-Received: by 2002:a05:6102:6a85:b0:61d:8fd9:fb26 with SMTP id ada2fe7eead31-62808a5f7f4mr1265865137.7.1777385424336;
        Tue, 28 Apr 2026 07:10:24 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-627f802d284sm1323462137.10.2026.04.28.07.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 07:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 09:10:17 -0500
Message-Id: <DI4UJOJMXTFT.2TJBNTE9ESN7E@gmail.com>
Subject: Re: [PATCH] platform/x86: think-lmi: fix possible memory leak in
 tlmi_sysfs_init()
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Guangshuo Li" <lgs201920130244@gmail.com>, "Mark Pearson"
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Kurt Borja" <kuurtb@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260428082207.357522-1-lgs201920130244@gmail.com>
In-Reply-To: <20260428082207.357522-1-lgs201920130244@gmail.com>

Hi Guangshuo,

On Tue Apr 28, 2026 at 3:22 AM -05, Guangshuo Li wrote:
> Once kobject_init_and_add() fails, kobject_put() should be called to
> decrement the reference count for cleanup. Otherwise, the memory associat=
ed
> with the object may leak.
>
> tlmi_sysfs_init() jumps to fail_create_attr after kobject_init_and_add()
> fails. The error path calls tlmi_release_attr(), which walks the kset
> lists and puts the kobjects found there. However, when the add operation
> fails, the kobject core removes the failed object from the kset list
> before returning the error. Therefore tlmi_release_attr() cannot put the
> kobject whose kobject_init_and_add() failed.
>
> Fix this by calling kobject_put() for the failed kobject before jumping t=
o
> the common error path. Since pwd_admin's saved signatures are released
> outside of its kobject release callback, release them before putting a
> failed pwd_admin object.
>
> This issue was found by a static analysis tool I am developing.

Thanks!

Just a comment bellow.

>
> Fixes: 9110056fe10b ("platform/x86: think-lmi: Fix kobject cleanup")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 40 ++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x=
86/lenovo/think-lmi.c
> index e215e86e3db7..994475eb0b9c 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c

...

> @@ -1548,33 +1553,52 @@ static int tlmi_sysfs_init(void)
>  	tlmi_priv.pwd_admin->kobj.kset =3D tlmi_priv.authentication_kset;
>  	ret =3D kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_sett=
ing_ktype,
>  				   NULL, "%s", "Admin");
> -	if (ret)
> +	if (ret) {
> +		kfree(tlmi_priv.pwd_admin->signature);
> +		kfree(tlmi_priv.pwd_admin->save_signature);
> +		tlmi_priv.pwd_admin->signature =3D NULL;
> +		tlmi_priv.pwd_admin->save_signature =3D NULL;

I think, up until now (in the probe path that leads to this), we have
not yet allocated signature and save_signature. These are allocated and
reallocated once the sysfs files are created.

Other than that, this looks good.

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

--=20
Thanks,
 ~ Kurt
