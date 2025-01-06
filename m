Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CFA29A5;
	Mon,  6 Jan 2025 02:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736131290; cv=none; b=B99lHbWb5lTpOLJg+wqT7nYbzDsB2AinYkdV+1p/wWDSTw/TGEb/zT3QFIqN9c28Qb301r+jX/CypiFQM4+VnN9MZkzxgeBQv0h4Pli5mlIY6Dg0iZdBnJ2DGd0ZRBLGn6Y0F83kIDscPYA8bU2QqCKafm9DJ1FGFIET1pBhYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736131290; c=relaxed/simple;
	bh=UJ/GocjO1JnefX2suW2+8t/0iNSkCdFLi5Lwd7DPWv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeLTMVTh7ip6t5TRtsSYylvKTNpXGYFt3G+IHI9M32p9SfMAxNNs41dRa0orbv7zmqPWHCGlp7s/EOtCR5ytNGmFMvElsrEobimsARmV/WRFdAHwLB1oK40nA8CaiiJFbsorNuIBMokjcKG4SFDl5jEoGGBfN5Fhl/dMf3110T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7oKZiDV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7oKZiDV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso183242865ad.3;
        Sun, 05 Jan 2025 18:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736131289; x=1736736089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9r7101FkL4cUTNajyt0kBb7QcDMx3Tz/7fQB/09Pug=;
        b=A7oKZiDVmqb6Ti9VOnAkHRk4jshPUZO6G6TqxPwyNE51EekOn5TXyzsjNqLZ8zRy9d
         2Ovqq1Qydzjs98YbrYBGBlUXfzIKcOPv6Xom1rbrAzocqQYCJ2UuO+Xqdg44bAHjCvFl
         OIzo5sIbxOmM8zO9lhMD/LtAL7AoxP1MSnQCWI8gluChFsx4o4vmrW7QImdkR+iX3Nl2
         lHKXiV3iimeqf1KJQdUqqGjjUeDS/WvMUeK1w18Hgws0RWCWujfqanE8PQqy6livkBTh
         byzpeMoTk1f++9RMiMOWZQK9OoqT/V0pX3S7JqlbgWxve8R9bZGnPuzRJsQyUunmz6xr
         wW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736131289; x=1736736089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9r7101FkL4cUTNajyt0kBb7QcDMx3Tz/7fQB/09Pug=;
        b=MUrWAVSQs+hLtGCoJoLhLQqdkFEulqOXVdqgiiGFJXipQ1k1CqtitQEfSd2G1JlE95
         L2wkTmcTiWRbGxW8ffe4Oxufgvy/+gtzMwb/RcK/8nMtoEdM5GTeTk1ka89CIbHCMasB
         EBJZyZse8PF2OVXwtiH8SemTloExzWOQVB3meKvhJJsQXhSefmHYR6QZLWjiOQ+74t9w
         RAa7iKRfEP6DE0dPj4Vlw8VI8bsDXehM556Jcdm1GlLm4phTIx7+SgH2wsSYy/CDR07t
         CPMbnuq+SP01Xqt4L3p295e2qUe3uiTQJp5f/gGS3VsnXWT5vO5tYP6maWIcTh5uD0l8
         5h7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmDUrZkiucNPOZ4kMVYnV8KVcR/uyt3VGSIjEX0fjBVPRpBRHRLmC490UxuXEfgis+Ppgi3bhln3I=@vger.kernel.org, AJvYcCV3kFbJp919ftJgVXBq7i8haPJ/jBVLig+pGVQQVOGB7x12CBVoDXBJGz11slUYDaDjK/ZTbFw6cIrxJ//0@vger.kernel.org, AJvYcCWT3ppi/HhigpxgwN2Xjmk7G1VSPIGrvXrjXHBYkWk9Xn2RU+wiEkRhGPXF9o2yekQqdzheAqviGtmFseG2gRonOAWoGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ2bPHsVveHYPNqyzH4sJ99B0j5pFZRbicar4yxXDYs4oAYu+k
	MpBopS7+/IMe9WE+etyvIwmaYBTVpQ0wq96GF6ylUQgYBwfPrY6n9tU2o0ViY05MSQQkY8IpDu6
	XqEQnQoyaDXU0u0OxP+qKhnlhdh4=
X-Gm-Gg: ASbGncvX9VigSCzoLNH4flC20VyA4UEIFNjXAxfCuvHd9xnoiLwUGCdYyV8v7iSsKgY
	OYjTQzgZtWb1qHmh+VmTEYfqr5YMJSbHh+9s=
X-Google-Smtp-Source: AGHT+IHK151DmSwTrn4/ZjM7skg2d/VPG9UKGpVtd7XC1Ag7KosZQ2DnQg/pHKwe478w3IfiMWmCQZzMa0G2Hl5RiP4=
X-Received: by 2002:a05:6a20:4394:b0:1e1:a716:3172 with SMTP id
 adf61e73a8af0-1e5e04609a8mr82081016637.12.1736131288660; Sun, 05 Jan 2025
 18:41:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227231840.21334-1-vishnuocv@gmail.com> <173548704063.4495.17991964884526324774.b4-ty@linux.intel.com>
In-Reply-To: <173548704063.4495.17991964884526324774.b4-ty@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 6 Jan 2025 11:40:43 +0900
Message-ID: <CABxCQKuV8RwSsQkL7YBzGLL73vXMTF4HhiqMhyudVWN0ChuQng@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for hotkey 0x1401
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: corbet@lwn.net, hmh@hmh.eng.br, hdegoede@redhat.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	mpearson-lenovo@squebb.ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you so much for accepting my patch.

On Mon, Dec 30, 2024 at 12:44=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 28 Dec 2024 08:18:40 +0900, Vishnu Sankar wrote:
>
> > F8 mode key on Lenovo 2025 platforms use a different key code.
> > Adding support for the new keycode 0x1401.
> >
> > Tested on X1 Carbon Gen 13 and X1 2-in-1 Gen 10.
> >
> >
>
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
> local branch there, which might take a while.
>
> The list of commits applied:
> [1/1] platform/x86: thinkpad-acpi: Add support for hotkey 0x1401
>       commit: 7e16ae558a87ac9099b6a93a43f19b42d809fd78
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
