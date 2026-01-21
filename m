Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F5F33ADBF
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991414; cv=none; b=iWjMDEaSl7kzErIBaXkj2L/UFNh9uq8Gu3LUpbptzVUxYtMHpU46cS2LTqw5sx68dpHmuFCXTK8QbblXY/YmKRm2iUuUV81zxm3iNTc8c5NvGBlyBZUQiFvG4zz/GqyiJfn+vR1+lBBbFtVRapzJYU4a1dvtYbX99Me20Cn66xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991414; c=relaxed/simple;
	bh=lW4Ce7dLJPHMTLk6Mv06UcJtVlCOaAK7+a6GWD3D3UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhuS62CxgQdCZQxP6/SILg7tQ6/6ZkO1kdxRyFycuavVV2bSTJGOC0RdrwALuiZEpV5KBL0HT/TsenQUuFbOXZAg1GWuJY72htdl5u6s3b16olBeSbBgf4QWX4o3MKkvzAJjJ6AFeo0CDwGbcDV2aAYV5s8GfTCMDs/8y3ZU/LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an16QfGj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an16QfGj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a7b23dd036so1630035ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 02:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768991412; x=1769596212; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=96kP93qtZ4BKG7UuG8FjtrMc+ltMMq7DIO2YZPNik6o=;
        b=an16QfGjhH62ozfkGermNhXaL3X0aHNc9K7g7/E8zI0sDT9dykEI6S7bD1eyjm3qhr
         oqfWs4jNel9mweHG65HhXMENgXt3LGetxagk9vNttUgS5dZa1EF6BuKt87ACmBgNvq9B
         mXEopI5CsbUEPxrzwn/I91q3YHwdaZcW7n5x27MDhmH1QoRaIVR7SgBLwOWj3GCZ2HnR
         iZUrIN++Hdirs0bc1My21z6mNcUH/zC8Wz5I4sCGAg0sET2dILYC82gtp3zGT71qvDwr
         c4iYuKzu6e+PlZ/SNPdzEmX//uFoAcivy0zm1pMeOIp6LqHvOJKuNlN2WKq2XdYcHJNx
         FQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991412; x=1769596212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96kP93qtZ4BKG7UuG8FjtrMc+ltMMq7DIO2YZPNik6o=;
        b=ageoITl+qCbyap6Rlm2Kn3A2hUuAN3L2VzR8ZXIGsGHEgpGusKJQmcuO4FyNyLWMYZ
         Xq1a27oPMjy1Zr7MR9Q89pEftxCdJ7UaPvW5v6HB5rbkcSdmMocDAxEZxsodpejCN72x
         NvfDq84r5TsvzU1YQNPBglhLM0mxNmLNRT1ZHmg6gjihWvhYEieUE87TwBHPInB1tESx
         wiq7ffcoHTCfbu4NZkLaTzm4tdDF9cs3aTKjQ33X/KxSv+pytwF+FXxXUku8J6XrC60S
         0UsjVc2flGBSXhR+fmCIUTHQtCr1RxjzSbPghm4X4U+tKXDeU4cVVOmnfcOaVa2sDDxD
         3jXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRqiRmNXYj0nlYvtIGCB+ZT4Fbzy4mw2uhByH4Iu/RAlX0nIgoTGrgUZs4JwmElsoDWtJ+WVw7ySSdHAvgIte1R8Sp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ApPt6QpLda/ixpNos7LgGwliS8cJ5u1vJ1M4LZgQ+yvWmg2/
	pDssUnzas5Ekmzq4aqP42A05DUiSG+0tso+BRhI5rFRPK8ZUW/ZZBri+
X-Gm-Gg: AZuq6aIHy+h9eVSvk0/+pmqWliipmym3lJtGvl793ZgK/wozmNctsb+Vq5Pir5UPCih
	/j3YiheOc3Do+PMdtbItBY5ukLajpPMJHkCHgMwRorlYtf+vaBoK68tCzdsvjc7xWiUuX8lBWWs
	NfEXabUVZJNWU97FXO6XTUVcxeL0cxo2e0gajPhEUSRAyOwHkXEJ65QiSF8WjzsphUVZ8P6vWAR
	zSa0jkGMZmNTsMkYZyOs4YoK+aiYiZzD9C0Dj7hYln3PH7qlVimzTObGoPDqq7aHEpka+pgz7ni
	WDcLXgEwOSnIvWs4kiEa8FQJ/4fIBfcX4ykyhITsdJHclxbRPRa6pPQwK7NkRFElQeC0O9V1oln
	/6kD4Jj5AkA/67DaZG5D1pCIlTwiFGO2YnZM2itQtYj64/7HypqLRq/QTmoNm+gNhu4TCMoW0fx
	aFRG7mpny8kcNXbkpIgLk=
X-Received: by 2002:a17:902:f788:b0:2a2:f465:1271 with SMTP id d9443c01a7336-2a718949948mr165766795ad.44.1768991411950;
        Wed, 21 Jan 2026 02:30:11 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:bd87:a308:8427:d21d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd533sm77430885ad.66.2026.01.21.02.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:30:11 -0800 (PST)
Date: Wed, 21 Jan 2026 16:00:07 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] platform/x86: hp-wmi: Add EC offsets to read
 Victus S thermal profile
Message-ID: <aXCnMsxMJ5Nio0Tr@archlinux>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
 <20260113182604.115211-1-krishna.chomal108@gmail.com>
 <20260113182604.115211-3-krishna.chomal108@gmail.com>
 <60c0e7ad-f25e-4e73-668b-4bb08dbbb79e@linux.intel.com>
 <aWpKUa--tT0ZSRKG@archlinux>
 <b2be1f6c-4f2e-cbb1-af52-46a85ecd5edd@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2be1f6c-4f2e-cbb1-af52-46a85ecd5edd@linux.intel.com>

On Tue, Jan 20, 2026 at 05:10:00PM +0200, Ilpo Järvinen wrote:
[snip]
>> I agree that iterative EC reads are not ideal. However, since these two
>> offsets (0x95 and 0x59) cover all (or almost all) known Victus/Omen layouts,
>> the risk of "hoping" is low.
>>
>> Storing them at compile time in the victus_s array as a part of
>> .driver_data is indeed the best thing. But since we do not know what EC
>> layout is followed by the existing boards in the array, we can take a
>> hybrid approach here:
>> 1. I (and subsequent additions) will store their EC offset in the
>>    .driver_data field struct.
>> 2. For already existing boards we will perform this iterative probe once
>>    during init, and store it somewhere common.
>> 3. Then platform_profile_victus_s_get_ec() can simply use this "definite"
>>    offset to perform the EC read.
>
>I guess we'll have to settle to that but it likely means we'll never be
>able to source those offsets because things appear "working" and therefore
>cannot get rid of the extra code necessary for the EC offset iteration.
>
>Another alternative would be to add pr_warn() if we don't have the EC
>offset yet for a board and not read anything (and hope somebody who has
>one of those boards will come to us with the information or patch).
>
>-- 
> i.

Hi Ilpo,

That is a very fair point, if the driver just works, we would never get
the actual offsets. I have adopted a stricter version for v6:
1. I removed the iterative probing entirely.
2. Added a pr_warn() in setup_active_thermal_profile_params() for
    unknown boards.
3. Known boards (like 8C78) now have their offsets hardcoded in the DMI
    table.

This ensures that thermal profile readback is only enabled when we have
definite hardware data. I will send v6, based on the for-next branch,
shortly after thorough testing.

Thanks for the guidance!
