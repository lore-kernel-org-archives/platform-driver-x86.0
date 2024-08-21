Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145E1C93D5
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230888; cv=none; b=lZN/y2jvBq3woSRQ1XhWf9xJqxHXwpnUjuQ4z+Zg+f0xgoa+vkKL0ZeXF/XY+9pOQM6Sm3pgrqY9VVZpq3iy4N7ocmzQYN4fKT3ugN1cQVaddYUwoMojs9BnWarvKUtaSyR69rG1C/rzea+Zu74Hk2mLUmgGw087Z0tuZOi8ZxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230888; c=relaxed/simple;
	bh=y6/GwasUAsKAaVXForVRn1dj1dmvcaZFTEypteIxqVs=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=h8SWRS8xS+H24V7snFjofkc2YdBkYv5/yovEqw5xgcfhux831a85jFG3+wfkTDKivQnMBb8S+mIOVgBM1RioLFbLO7kbW5snicrmKT42M5yTtT9S6c5SrhVeIWZcM278sN4g9Yciw7Rc5g/7xox+PlpxvWyUvPIdz3TlNVoM1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXQ11ivJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXQ11ivJ"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a8657900fc1so164106166b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 02:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230885; x=1724835685; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6/GwasUAsKAaVXForVRn1dj1dmvcaZFTEypteIxqVs=;
        b=iXQ11ivJO3nihhkMid83yjQSuKg1qvNn7FPwrvfi235ReWDapN4ta/6UF1mg6VZWUU
         TQlFd+Svu2VUOOGehAUh2+9buPcuEx/LFyY9eGhrzjUa5PkHtOZ3GobAjOFjY6dGv0xV
         4Z8pHQnHZuhEVCoRtxeXilmP6vxWEeuKKnJy5uY+DeXpP1y/8YhG1Hf5Ue+be3gXczeG
         gAPYeLU52CokI589eL7KaagGWBFea2UgoKUKkBy/0GxO/+aafBR81DuwCU6mi8pIb+7p
         K/7ND1YBSh2ajaNM3+XkohtjXlaO/vm++poXoFuxG5sExe126lzgzFX5xmP30OMd6pxN
         sctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230885; x=1724835685;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6/GwasUAsKAaVXForVRn1dj1dmvcaZFTEypteIxqVs=;
        b=bV6nNvYDgNxi6lzHh/ShVGQs7UE8sxE8qWDVjNX+V5VFb2HQ/DIY6eIhXV8jipzqMs
         wtxV3Pezua3iH4gwtQQBgaE6DR3B8jVSO7CT3sR/M217X0keFpfLE21bv7vE8OsRosXy
         8PxS92tBuo/T2Cu43K/muBegl9Dcuyttz5doVd3gb9R+HEnGPKcHNG0C5iEYJKjwyiNL
         KjwKK+WOZ2JxOqCeUOdfrvqMKpnzE00o43kp+fRJNo+7bPLdw0ixriXY5XN5RJLEIS3q
         xZB8ulQnjXvyiXQCIbtsi5NjvIqT6/JABOr5svvIe6D+/otxIw36k4rGVaV8PowwvXEd
         PQtw==
X-Gm-Message-State: AOJu0YwBdZtItyrsttYhEZRIXEmx98UrglWjK1nNmedaE55GeV3k7Ut4
	GsFqKjumCzjUVLXA2Ly5IwGDcztxyray2LPVX7z8rVKWf/elglqM/zVi3Q==
X-Google-Smtp-Source: AGHT+IGQZjEe3j7NNmZ/Qh5uh9Hs3sIgKo1e7CW0itpxk2Xwpi7kEkxX9vyBKL+s18BGxAAaUeFaHQ==
X-Received: by 2002:a17:907:842:b0:a86:78db:c087 with SMTP id a640c23a62f3a-a8678dbc5a0mr84395066b.16.1724230884698;
        Wed, 21 Aug 2024 02:01:24 -0700 (PDT)
Received: from smtpclient.apple ([2001:bb6:a167:6800:a95c:cfc6:6b17:95de])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396d5b3sm866635366b.215.2024.08.21.02.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:01:24 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Rayan Margham <rayanmargham4@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Support for the Acer Predator Triton PT14-51
Date: Wed, 21 Aug 2024 10:01:13 +0100
Message-Id: <202FA1F1-967D-4D99-94A1-9649C7C9B6F6@gmail.com>
References: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de>
To: Armin Wolf <W_Armin@gmx.de>
X-Mailer: iPhone Mail (21G93)

Will do later today!

Rayan Margham

> On 20 Aug 2024, at 19:48, Armin Wolf <W_Armin@gmx.de> wrote:
>=20
> Hi,
>=20
> while trying to implement a prototype driver, i found out that the acer-wm=
i driver might already contain
> the necessary bits xd.
>=20
> Can you try to load the acer-wmi driver with the "predator_v4" module para=
meter set to "1" and check if:
>=20
> - fan speed reading works
> - platform profile works
>=20
> Thanks,
> Armin Wolf
>=20
