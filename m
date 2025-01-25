Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED858BEE;
	Sat, 25 Jan 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737812568; cv=none; b=OuWwYP7uqvUQCDA+kDLxXQtIRnMmdDT9r85hRS18gCSyrSJRbEqLbpg1G4Ouc/bQq1eTkKSAdDudkzN+PEg4MGAX0IRtI7ZpqtRwK2BwXyfhzpEWXy9jahRyFOzFv5ODKCWphcoPy3hnOl+WJj7JRYSCgaHmMWBTD0Jm9xbv3o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737812568; c=relaxed/simple;
	bh=rSEwbmK3X/jDCBGNCcyrKdX3DDHNUqN/Dk9YRLY3PW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emINFR3sRadUtpGI7rMtCXx4B2UyDmhx2qFsAcSV2bNWnS9O34HW6mMdZrwCdNpKhmuxMO8VxhcDSWyesuFFySm8AA0WKNgp45y/jtwJEWdaCukQIj7850H4Oy1tJ7/gzpHzVDOH51w3B2SylFpHj5WAdThvxGMvF8MxPgrhcwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844dfe4b136so74905539f.3;
        Sat, 25 Jan 2025 05:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737812565; x=1738417365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uI/6nIBJPxcpt5UDUveTWNMTNVFXAtKS2EFOnvbHqPE=;
        b=UYjiZr6IK/lNsbq89rBbUuJ3uuAlbpgKSblTqg5E8DygkqT7/WHro4ahrQIa17qWHS
         Q1X6xbszSLXiTiFqt96JYhb0tZjW2NF4RLuRrkvKrtWaQcSGcd8WkFpnPv3q5iI3YU0i
         KrHCXpgEM5CcaJBVg7WwjZpBTaAgoGjIEC/vfbxfbKxLLK74lhAIUJRPjt2YsQNz+FgM
         yixznlE+ItjJw8U1SEwtvwkds+PshE6LyOmUpBpc62MlL/rWAL5eZRRHvtdn9Tphf1im
         DvEDaqFj58wdPQpNiXu+PyDclRLl0eHe/Id+Zs9f+/6o/5FEMOY6tupRUdIvIIFQJbGz
         7VcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCWkkg9wY491h8/cTuqsOa/sU0weoy+YuXWtbFHe8wx2h9I0HqH8+xhzzOZrAGk8bmLoSZvceYmghUpL5G@vger.kernel.org, AJvYcCWyTOpgn2+qR5m2dNl5BJLvjaF3/+0Ph/zcdbMcB0n8xHCj4ah8Ft0F6hHjE33u5QvephYChWX2+0iyJl8TyyHHoteQVg==@vger.kernel.org, AJvYcCXipP3iHa7nWJDvmm+Rsv0fERFTKcv8qPpGn5LQHyziWXLmKcb2tvO3KDplNzvFtCe7IpokWFFBK9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/M7t8H7mADfz37qSvwLd2Mo7aD4pbvzyKEZNvI6uq8yEFBtjt
	bkOM6QLrya14Jn1yM6gnAFKgXlY2fWaEyiwi3YA0FksHsuYFyFq9NxBSx4WjZOs=
X-Gm-Gg: ASbGncu/82LJIQAaumFdawIa3dGYculNYqPhZpfdZBgOC0IhffQul4C4q0NataPwUnq
	8XJjomCFLuF5Kre/BvMzgqziUdxMD8/MZ7pmhNOcJ4qpSoQG12QlmxtKRp4qvWFCkksNGkhJulk
	S1/BDdai/mtLqhE8k9KDE9+e0uRdUpKLdYdqdWCk80m4UCldkDYqKbypWci3eSV0Bme4RJu/6EM
	Fyfyk1B/SN0RfiLZtTf50yKKaH+e7alg0SUbW87GYfeT4P76esw/EKRKuuQAved8FBtlGKbRSRd
	7xAijUjqjLkWvR3NkBWrWq4ozcCuJWqbeOCSR1nYBt9fU1jixw==
X-Google-Smtp-Source: AGHT+IFrOy2kb6MozAzoyITJb0+JOAxrMupYGhx+slRk7HRyjF28g+3p8e4FJi0xag0u9PNILiyNjQ==
X-Received: by 2002:a05:6602:26c5:b0:844:e06e:53c6 with SMTP id ca18e2360f4ac-851b64f7425mr2793963439f.11.1737812565148;
        Sat, 25 Jan 2025 05:42:45 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec1da4d013sm1388566173.74.2025.01.25.05.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jan 2025 05:42:44 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso10868275ab.3;
        Sat, 25 Jan 2025 05:42:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUR+DVHKV3fBbUlAAC9KpmMt622nFMzm6tkXSkVcwEOTFkojfG08Z76KRb4+ewqazvS4Qecb6tULWTSWXrT@vger.kernel.org, AJvYcCVRDIH0tIifhEW5i18PFSssZlG50t+iJOwbVEeZMECKr7M8ex3o7julyMXQULuf/QIkiZvC54K7njU=@vger.kernel.org, AJvYcCX/k4o8aiNNxpXnZuWuYyUGUbhhZ+6rL1vyINbB8+W/XYQ9hhgrLEcrRKXmMemkCQ0mP1VaYDJgE7OegWC+L+OcPYL/5g==@vger.kernel.org
X-Received: by 2002:a05:6e02:20c8:b0:3ce:9149:a8b1 with SMTP id
 e9e14a558f8ab-3cf743e94f7mr258102435ab.9.1737812564542; Sat, 25 Jan 2025
 05:42:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118202632.8352-1-josh@joshuagrisham.com> <e67bf708-be8a-4331-b250-d2f31e38536b@t-8ch.de>
 <CAMF+Keb5UzEUeim=33JR=Vv8qK7xqGn_jjNdtZMQTFtrpKrgSA@mail.gmail.com> <d242d780-9084-45c6-8df4-a78b48b80059@t-8ch.de>
In-Reply-To: <d242d780-9084-45c6-8df4-a78b48b80059@t-8ch.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sat, 25 Jan 2025 14:42:32 +0100
X-Gmail-Original-Message-ID: <CAMF+KeaGziFZasLT6KCqd_fYBTNeSPPMDMoXAFgdVLxE1tugMQ@mail.gmail.com>
X-Gm-Features: AWEUYZlN-4j8Ncz7QrSw5z4PM54uHNs857LlrSPzllb4QPB6A2N5Mh6-VINwKmU
Message-ID: <CAMF+KeaGziFZasLT6KCqd_fYBTNeSPPMDMoXAFgdVLxE1tugMQ@mail.gmail.com>
Subject: Re: [PATCH v8] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: W_Armin@gmx.de, kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den l=C3=B6r 25 jan. 2025 kl 13:26 skrev Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net>:
>
>
> You could designate a special error code to mean:
> "This feature is not supported, but that's fine and continue probing".
>
> For example EOPNOTSUPP:
>
> ret =3D init_foo();
> if (ret =3D=3D 0)
>         priv->have_foo;
> elif (ret !=3D EOPNOTSUPP)
>         return ret;
>
> ret =3D init_bar();
> ...
>
> [snip]

Hi Thomas! This is an good suggestion and might make it seem more
"native," which I like. One thing I am worried about, though, do you
think it is possible that any of the other functions called by these
various inits (registering various devices etc) could or might be
updated in the future to legitimately return EOPNOTSUPP, in which case
when I just pass their return code along there would be some
unexpected behavior? (that the driver does not unload but in fact
continues)

Or are you saying to return a positive EOPNOTSUPP instead of a
negative -EOPNOTSUPP to help ensure that this problem would be less
likely?

Thanks again!

Joshua
