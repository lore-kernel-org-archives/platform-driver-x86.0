Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237F8485CDD
	for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 22:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943346; cv=none; b=ZFLDd1FQS44SjBDG9bnINqQKkDoMSPgqgl+Nr9LsC89MnVhjRucXNj+uYnTJekZnHwsUuq6MV7VGKd43MDUsoGZFDPxq70U+fe5SAOUO9ywnc/1ET2o5X1aV5fhGO+Gofo2Z689aDeezucTGYXWEez+2UvYE8NhMRQA5hX33Bog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943346; c=relaxed/simple;
	bh=T6+6UkLdUh4P50AL7Qt9EIu1Or29dfj9n3CGsn79zjo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=irPjsjnzSC1/GD3BFO2rQEl9j2FKguFqIac1aASLOZAjue2voCybtePDrQALyFREtuBsM+cE/jFpeKSlhFbSVM4KG/pYW7QEvNcOjt7zGVRqjG8YqK0BznGME/LWjJkS1jG3/uC6DIJ1adQZpVhy/8pvomyA2l/ZQGFIFRlVxIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPNLM7HY; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPNLM7HY"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5121bcf1aso1967921a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 15:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789943341; x=1790548141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g+AxpEx+Wxn5rk/C0OJjKiwR2yvDIToFVKllW7bRQNI=;
        b=WPNLM7HYKWoW+kd2xM6a+FNvu9PUnM3JqQcws0Cp2X9t0a5itnNFmU8WQn2/Uh2cKS
         8RGxCzsmOzMwkXWxI8uJPL0l4xVWOF2HJyrYiCpZLEJfRx7G4XjAdOv4MHwCnu1DsK4I
         PbRQ03uP8yexiE3gldSMauEnqEXK/+HUmmTBRGrWQ2y7hT0JN0VsMCZO/Dzm1qgq0pcP
         /MVaAV2XZOJHChSUq6+98aG/nGOG3uUdKXaCjBbTEAMNU5+N1xIkKRqu6Yeqgx1MazNE
         zyoyhqljixvfOCMgoJ0VS8Ub4uZGrdN3ve5uVD1Ls6m9FkNzrG0El+oJrf0JTtMPClff
         8DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789943341; x=1790548141;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+AxpEx+Wxn5rk/C0OJjKiwR2yvDIToFVKllW7bRQNI=;
        b=0IqLLN4FD13mqG2Pabqj1ZDKTqZUnAFYU4OSOp3BvDNJc/7U4Yk9YeWwL9Tt3mpBEK
         PJNWXjSXmGmUpurvq6+sjp7ZlsCVMduRLxBG4zRgdYPfMTZQ9+MoUYlk3caZy37oyfA7
         EVlM5VPykAwe6LN2h/a6zdPYo9cQKxq4dxROLhDaMYD9gIxkaOO2JOPo/9lbt3zRXOs9
         kHFObl9676dpxg+DDzFaihwF8Ah0BrWRwK6dRis+W+I1G1r+aeKwfpUY9Dvh5ljndLXb
         FntwMkGSSHixNB3zXy8WdNYZpUf5fny46I0KXcZfW3gHKHeKnhPyWUlvjop5ujDExCXi
         v1PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzC/mErmVWBWzAjsqJNGyQLca24UlScugJZThqW/Q/nE7ZGFqPacC8aOE9hfGmXgCZj3pMes9tGhJIvh0nN3ZTk5rVL@vger.kernel.org
X-Gm-Message-State: AFuF++mjFxrdvAE04W3Hv8nOWXsnNzdT7K4/CL4RvEjTKA3Q5M16jhK9
	E6gCkdTdk+JtoymQ8BBttRwm2+fMTW03VMyrL7RLlJbmKFoLxtDhJPOM
X-Gm-Gg: AYBFou0mkMqb4UR/Wi1sAcZPQREhZr63IVxCCHdBNPhF1eCqM1IYlgnTu24CyQ4mZY5
	wldBxB0XCmEOYpauaDovvZsuIJ8b0g3VEgu7XfshEd8FdcxsFSAZMeoYJYGXAMdfK84ISOL1aOW
	TypW/JxXENNiwZqeavI1iiQakfVt9f6eY8NHVpO5DmtuIjafwz/6hGUw5Rlp4yQ6icZoFs+Qviq
	EL/Dyy4orCkSXEgWmV1lmbfeJAQ6OoJoril8zGwMnGOdgbpuoWzv5PAgf1H0rq1M/zsqaJxIBJx
	So1H05V3xC7zfFMC5sdDeIvq/xvdgjugja8t2o2NVQN5+0yXj0QU0oJoJv+saScOqHRgpcDGVQw
	EeEVFdODx99dWzvKyOo9uXzZGVRRR1n+SueoaSt5bYXmz0113MEO+nZjtBzUaqYg/5i2vnaTLlC
	Awf7Ccjia+nxoS9NqcWLznhiqJqXghBPs7DoGrXU9beq11/glI3WBH9qnwEieofM0VKEAeJeBz3
	6L0/VEAC4ObHHVP8HbspkYJzCoGW7yvKUwhk44BcATonhaeF99sI0KCPbsB23imd1wf
X-Received: by 2002:a17:90b:314c:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39e54e78990mr14006626a91.19.1789943340978;
        Sun, 20 Sep 2026 15:29:00 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318763bsm13162827eec.19.2026.09.20.15.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 15:29:00 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:29:00 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org,
 =?ISO-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Eileen <eileen@one-netbook.com>
Subject: Re: [PATCH v1 2/2] platform/x86: oxpec: Add OneXPlayer 3 quirk
User-Agent: Thunderbird for Android
In-Reply-To: <20260920190438.3444923-2-lkml@antheas.dev>
References: <20260920190438.3444923-1-lkml@antheas.dev> <20260920190438.3444923-2-lkml@antheas.dev>
Message-ID: <5C44FB9F-0535-4A78-A47D-AEF20F33D8AA@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 20, 2026 12:04:38 PM PDT, Antheas Kapenekakis <lkml@antheas=2E=
dev> wrote:
>The OneXPlayer 3 is a new Intel device by OneXPlayer=2E It uses the same
>registers as the G1 Intel edition=2E So, add a quirk for it=2E Battery
>bypass, capacity limits, fan curves, fan tachometer, and turbo button
>override were confirmed to work=2E
>
>Signed-off-by: Antheas Kapenekakis <lkml@antheas=2Edev>
>---
> drivers/platform/x86/oxpec=2Ec | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/platform/x86/oxpec=2Ec b/drivers/platform/x86/oxpec=
=2Ec
>index 38c272995437=2E=2Ec4c4babe8e30 100644
>--- a/drivers/platform/x86/oxpec=2Ec
>+++ b/drivers/platform/x86/oxpec=2Ec
>@@ -223,6 +223,13 @@ static const struct dmi_system_id dmi_table[] =3D {
> 		},
> 		=2Edriver_data =3D (void *)oxp_g1_i,
> 	},
>+	{
>+		=2Ematches =3D {
>+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 3"),
>+		},
>+		=2Edriver_data =3D (void *)oxp_g1_i,
>+	},
> 	{
> 		=2Ematches =3D {
> 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),

Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

