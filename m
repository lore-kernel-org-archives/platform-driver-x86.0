Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065561D7E50;
	Wed, 15 Jan 2025 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736978078; cv=none; b=Crv6LBVBL47xOxqrQUafKXj+AXmVGqjwMGdaUlrDdlqG8MJLd0zifxwnqA2URjQ2F9+Up9urqtZkDvpEgiicTYFIp37n65FGQSnasLhCmQj0pZY34pO7IE5GaCPLxOTxdhioQ0NOB3jziDify0D4VMTuoA3+8tK2nCTdie1jnok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736978078; c=relaxed/simple;
	bh=WuPqpdYt7FHRN4TGdzFsC3LAN8mEpMge1Lfmm1q7fn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMVi9ZuWA3s54w5eYmQL1oiEJYobP6fnII/coDLvXOiWWsXiDuTLV8qDHlY81YMeET24YcPFdCzWTWG5/9HEo9y+Nj/BvUhzTaemRoai2PuJn2dXdpdybi5pyy42Z16I2xIEwFTf+DmRkuQUVvMtuLtES483n2TdKTQsZyGiMLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbL47cUw; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbL47cUw"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afdd15db60so37442137.1;
        Wed, 15 Jan 2025 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736978076; x=1737582876; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/KjUO9UrA/J3p/+0UVLMCwvvzJwTgGM4x1mRY1L7jp4=;
        b=bbL47cUwiSHuIwDL9GzhwXjf2gkb3xo07n1JudL+tsKU3anHjVIjNgM7dfYu4Ya71g
         DXCS9tacuZI39IG7kKkj7J2UoOXyJmgN9oOxd6t91cVcPeL9i55OEw/ebJTJ6JxzbyWq
         W84tdsBEN/fiVW6ZSorwt0UqcZgxoTZj6EATvZx6zj8D1KsEdrXyyKf6+Ph7jLssyU73
         hTzT2jDtXit/P5rlmcllyR4MRREpS55VtDazu5D7ls5RrWdAbKdwS3fyC8o/QFPOUb+c
         JHnWSJyXxqVUUDD8i8uhDXBLXrRpMzhHP7xEqjTCbz3PobeXOzWb9KOD27XAM/xaQIZ4
         nB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736978076; x=1737582876;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/KjUO9UrA/J3p/+0UVLMCwvvzJwTgGM4x1mRY1L7jp4=;
        b=prg+mpwZV8VriTfwyPx9uBhzjQlwWVOfY2EaIkEBai5IwqhSw0DnoqSJ6r1GzT8eDR
         d6NljgzW5nUCsQ4nBGdkj4pTbTwPYNV0w/eJl0LsEeySeb8FDa8kSy0a0nO2V+hVtr5a
         pO+8JKljCN2WFw3TVduXvJ2wyg/ZT57b9M2oqclaIqXXAIjKw31M6yx4EWD7lY3RSEpG
         FD+/WucmScXP5hDiJy24ZvcKujUJwdflDnibSd0LetwH1yFU4Np5+bilHTY/Tf0NImNV
         EXacpoS0adloRYEosozEQRGSI+QWmtjGNpOg43u5dSSuQwO93UrqIXwIcVUAq5DF633D
         R38A==
X-Forwarded-Encrypted: i=1; AJvYcCU5ogvqpGrjQaCxXDMwC0urawAmZkhG6lMYyQjHAEFkKDwct0IfOEObyizSt+ShePfeJpshl2IpD403+es=@vger.kernel.org, AJvYcCW3UKDyxIlewG2z+EQURzEvyFlgJL2bE+WIKwE/4YAlNpqdzr3tjczpiRfOAyVMLEkTV+8oP4g/mMbGr5F8dvD/VDHqjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9otfjEHX3JLetghynCOfXNTCWq7KvNCmhvhCPA5r69cHwGQoy
	pRfj5+UlUKX2ATJyDRMMhC0VDCcijtsJ0JQBfwWWjlXaEjnO5rn7
X-Gm-Gg: ASbGnctKSK3mEYXwNiWVpsXh2f/VMifsWbjt3cJfix6R2S+Zz7WALeFMVFW57DPIHKc
	wQFCPT82l5iXPHEwEoTreESGYb/ZLFVvefq+6lzBNpeeRFqXdYoo61RgiE/fmfr1M+71JXQTkAE
	KmTxbKnKie4dGN7usrQuDhD6jpcf/7GGmI9hKngcncRvJ7AWAWg5LkIkcSRO8gGcMai09fd1uCQ
	X469LP1sKmeaJXXWQcpPJTdtgwwS8RQmWGmdSSLMffrtXlUOL61xSp5
X-Google-Smtp-Source: AGHT+IFXu4kFvhEAn+e9gmKrvCwe1HOn2037gaHNhUgs4p/c6OtEZge6yCcsTEH6ZecGs5CV/4lVqA==
X-Received: by 2002:a05:6102:26c5:b0:4b2:5c0a:9afa with SMTP id ada2fe7eead31-4b3d0f66b7amr26965257137.4.1736978075877;
        Wed, 15 Jan 2025 13:54:35 -0800 (PST)
Received: from alphacentauri ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8623134c6f8sm5983854241.4.2025.01.15.13.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:54:35 -0800 (PST)
Date: Wed, 15 Jan 2025 16:54:31 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Hridesh MG <hridesh699@gmail.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 0/5] platform/x86 acer-wmi: Improve platform profile
 handling
Message-ID: <xbyvdobhestqwdl7v4oip3lmi5ijcragnalqbmbacwh7bxqeor@dzbhtxttukcn>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
 <173695186401.7584.2765000569734785177.b4-ty@linux.intel.com>
 <CALiyAonhojK1-z6iZSkHW=pnNOo7WGf_3ekxHnabDX0B4=xsvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALiyAonhojK1-z6iZSkHW=pnNOo7WGf_3ekxHnabDX0B4=xsvA@mail.gmail.com>

On Wed, Jan 15, 2025 at 08:53:12PM +0530, Hridesh MG wrote:
> On Wed, Jan 15, 2025 at 8:07 PM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Mon, 13 Jan 2025 18:44:08 +0530, Hridesh MG wrote:
> >
> > > This patch improves the platform profile handling for laptops using the
> > > Acer Predator interface by making the following changes -
> > >
> > > 1) Using WMI calls to fetch the current platform profile instead of
> > >    directly accessing it from the EC. A new helper function is
> > >    introduced for this purpose.
> > > 2) Simplifying the cycling of platform profiles by making use of
> > >    platform_profile_cycle()
> > > 3) Using an ACPI bitmap to dynamically set platform_profile_choices to
> > >    better reflect the supported profiles.
> > >
> > > [...]
> >
> >
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> >
> > The list of commits applied:
> > [1/5] platform/x86: acer-wmi: use WMI calls for platform profile handling
> >       commit: 2d76708c2221dde33d86aeef19f6d7d5f62148b4
> > [2/5] platform/x86: acer-wmi: use new helper function for setting overclocks
> >       commit: cd44e09bb89d4a33514b9ec3d972f0d2d13f5cfd
> > [3/5] platform/x86: acer-wmi: simplify platform profile cycling
> >       commit: 61c461a90fbfc038d9663713f293d60fcb58c41d
> > [4/5] platform/x86: acer-wmi: use an ACPI bitmap to set the platform profile choices
> >       commit: 191e21f1a4c3948957adc037734449f4a965dec5
> > [5/5] platform/x86: acer-wmi: add support for Acer Nitro AN515-58
> >       commit: 549fcf58cf5837d401d0de906093169b05365609
> >
> > --
> >  i.
> >
> Awesome, thanks a lot! I would like to once again thank Armin Wolf and
> Kurt Borja for their guidance and help in creating this patchset, this
> is my first meaningful [ to me atleast :) ] contribution to the kernel
> and I'm quite proud of it. Working on this issue was pretty fun and I
> learnt a lot regarding different things, it really did make me
> appreciate kernel developers even more.

Hi Hridesh,

I'm pretty much still a newbie, so I'm glad I could help :) It is really
fun to contribute to this community.

~ Kurt

> 
> -- 
> Thanks,
> Hridesh MG
