Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57031E83D
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370565; cv=none; b=QawklNURRIzPiQHko5rGrgJ6T8sxVpN21b101PULlw5WAFYd6zUglLhbOXuBTuWtDsL0RJWh9PLnT3Qej/aQs/yOYgui64Q+CctYSeVwWvOoOboRh8yirh8KNKscabg7TLBpmh4YB8k16bEojO0kBlMGiuco45qjs3YjLHpX+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370565; c=relaxed/simple;
	bh=DghJdUC5l6A7mqPywPmIh7dNttCNMgGGRxnPOa6o8Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ME4b1SXdVMd9lR3QIT92hGkTjsqgo6c8wVLZVAR6URVlw2fFdatslpvyxbWvtil/2gPNYYVsMVZnY7yxhovshKHeV1Y+yhqMRKBnn+pA3+KsV7FIVeap3goJpO77W4iNhPP0IHan/j3cKj/PMfxBguEuGVLIiVV78fmCYlhJ1Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/2Oj9QM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/2Oj9QM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba17c8cfacso58434215ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779370564; x=1779975364; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJOriypMluGCYSJ14jPw3gzZfeyQBCkgWX8iI2cvPiI=;
        b=I/2Oj9QMrnoIxwl0qbhjsno+xhvdfOBHM16RClMrgyd6PzzABur5WgdVQaXvPSf6dd
         Qq3ytiWD9GXbNRKGYi6AA8c1OoC6XrrOUOGdA823QrlEr5G7ohhDpHk89kOIbeWjUwqr
         R+yrkru5sIp8modTMBbVRbNXzlpcOA/yybQLex4oZxdeOv8zD65P1r8UJ6D/r6GUn5A1
         +suIe/cWsAbS9sE6D1AHbNCLEQvGBV0adOuDp8tgvCa7SHUi++l0vvCR4dPrDKJ9ZMld
         afQcvmSG98piq2r18WiLxi+Wb9hy7KBeEshYKY3m57Wz3YAYqEd2oN78nUp9QhpgKFVO
         SfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370564; x=1779975364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJOriypMluGCYSJ14jPw3gzZfeyQBCkgWX8iI2cvPiI=;
        b=KYgDH0fOX3z1lmoxJd+VPRS0YxTaAPZkhEmwIY5Q7PUcj6jUteuyPJ3dX446BK5kKe
         /VkzQiWadPS2WkJOcudcunDf5N5gUbqugGGUAxjoFm4QszpfVUL8maB9tgv+EF3o8I9H
         3ylLbT1d7qiYW3YiRP3oeQxcvvHG18DeOQPqiOpucf1ehHIecGohf6nH8t6CnSgkeVHS
         2ojzz4GBRLiRXhZPins4Pn8WDC2YjH5+7cYs67lbLo6yXsjmFrhscdDCbit34xYaINmc
         lbUMo898p9THHpRHdBrit5hOdJ0wDXyHRfzlM/wPZullBJY8Mu8BzTzUHeECq0fA0eCx
         l9uA==
X-Gm-Message-State: AOJu0YwczNBLwmGMqYbYcvUQs39j/KCAjKJiPKKfDvjxVvK5LXUPAADW
	J/XDNl/gyvA34n8MaAz+iJsho1OzElnTklirLuarAFAM50oEvt00wbnvFWarZA==
X-Gm-Gg: Acq92OG9VzGy9/Pd1WSWwHfNdCckAi5on0PLhqWQ3PM0D5WAAGD+vcFy+og+n6S1eEn
	a7EpZhwgwraCJ/wNyODaucJBSSx3nT5s85rZb1UenwHoXJDhJfNdkhgsFqcYbehwgKZ9aFWcuxh
	2mionR+GkWE8iPiXy8aQCMtiLZ1l8m9nIx0LU8DX5EfHJUEouXW6uARvJ+qfoeS1aQqXDnKxzzH
	SM7DKgrcKzSPlprlzPg1BhvUaQCzrUXevG0ZXUSJD/oWzDHP20WJrrJcS0ZIEnPgiLkOu2Lwz8t
	SX7BsjzIFRHxhwP4LllCUDM0DBFoBEKK7Dc+S5rFEpoJ+qfiwiMIoCoNQ7FDUH8PROMpq5zYHi9
	ouhbJwBiovfRyVQdm06itTu9RTBlNB7mwUCaznx1Xrb73InysVzbbDVBKV6xWEOg45BGeQ4Jp3y
	haKCdjQSCYfquKZj5hq8yRJlmW4NYQ93v8CcBPBXACtHU7F5pemX2UxFjP70HY5tR8db9uAH5D3
	Iq6Oqm3HPn6k4xWVszx
X-Received: by 2002:a17:903:240c:b0:2bd:907:2cf0 with SMTP id d9443c01a7336-2bea33a548dmr32375895ad.32.1779370563810;
        Thu, 21 May 2026 06:36:03 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:72b8:b88f:97ce:a863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea98ecaffsm16260465ad.39.2026.05.21.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:36:03 -0700 (PDT)
Date: Thu, 21 May 2026 19:06:00 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Radhey Kalra <radheykalra901@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v5 0/2] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan
 control
Message-ID: <ag8FxNbcBroC5Wqh@archlinux>
References: <20260520140800.130530-1-radheykalra901@gmail.com>
 <ag3yZmFDRUqsoVAm@archlinux>
 <CAJ5VyXL0nYQXb=R_5Nd=HZCLiPKFnrJ+ttXb=D1LTAN2j4M2vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJ5VyXL0nYQXb=R_5Nd=HZCLiPKFnrJ+ttXb=D1LTAN2j4M2vw@mail.gmail.com>

On Thu, May 21, 2026 at 06:19:48PM +0530, Radhey Kalra wrote:
>Hi Krishna,
>
>I tested the current platform-profile behavior on 8A3D more carefully.
>
>The board already exposes the generic hp-wmi platform-profile choices:
>
>cool quiet balanced performance
>
>Writes to all choices succeed and read back correctly, and I do not
>see hp_wmi errors in dmesg.
>
>However, under full CPU load I could not confirm that these profiles
>change CPU power behavior. Across quiet/balanced/performance/cool, CPU
>frequency stayed around 3.27 GHz and the reported PPT stayed around 33
>W. Fan RPM rose somewhat later in the test, but the system was also
>heating up, so I cannot separate that from normal firmware thermal fan
>ramping.

You are right. Because your board is not registered in any list, so it
goes to a fallback route and registers quiet/balanced/performance/cool.
Changes to platform profile are handled through this chain:

hp_wmi_platform_profile_set
	-> thermal_profile_set
		-> hp_wmi_perform_query(HPWMI_THERMAL_PROFILE_QUERY)

For my device, when I selected victus_8a3d_board_params quirk, the driver
tried to use this query HPWMI_THERMAL_PROFILE_QUERY which failed and
caused the driver to not load. In you case, it looks like the query does
not return an error. However, not returning an error does not necessarily
imply that it is working correctly, which can be further confirmed when
you mention that changing power modes has no physical effect on the system.

>So I should not claim that platform-profile policy is meaningfully
>validated for 8A3D. What I have verified is that the Victus
>fan-control path works.
>
>That is why I avoided a plain addition to
>victus_s_thermal_profile_boards: it would move 8A3D from the existing
>generic platform-profile path to the Victus S-specific
>platform-profile path, which I have not verified on this board.
>

I think your board does need Victus-S-specific platform-profile path
because the old/legacy queries did not have any effect on the system.

>Thanks, Radhey
>
[...]
