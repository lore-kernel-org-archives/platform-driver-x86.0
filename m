Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB0385513
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Apr 2026 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775675243; cv=pass; b=XAcFSlrhOCYAUUg1MTm/tTlGG4itoUO/lt+TV4VwHPjGhGGDI2sqFWTmxity2FDQPf/D8zlUbwmahmLjgY0zsPBEcHpTA52BgMwsow/AxY7i0cuQghp0R5wa655u5AdN9ouimSNitGVseTVj2YFuUE+fOEskwT25HqXkRNqoGoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775675243; c=relaxed/simple;
	bh=B3GzhcznlTgp3S6SnojCWf3qgJxcSS+uWQsFtA09RSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z038LBF2icnTF6DW0cJ1khXPlTMAExXbYhSvCVxap9XorLgAc7hmhNTYH16EFF0HJZmYILBWDgbVRJN7RRwouN1orSNxmdEgX+cQTl/sRV/QfiFqoMjqnXADMhd8feUPsoow6Wu08b49Fwk7esa2ruc0YdTrQwTUpNZ9BuW04SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/M1AyMB; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/M1AyMB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so10261666b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Apr 2026 12:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775675240; cv=none;
        d=google.com; s=arc-20240605;
        b=eIvseQqitRSNmBFEnWRGP7aEk1xbby0CG5ByNX9ZY/eJDCG4BS2QkduLjAlSmx3yUy
         aAT/5W5WTzCM4nUI64KW1yLINjYyZod1T4sO3gnuCtP0g3dOWGsS4Vt/vJYFH5eGj454
         YrlnjpbUaOILkeaZ3lrz6UHlzI2DF+XJp8RBThQLL/oW/hLRpZTSbNfNwMQUe2n52AWT
         4WJZVuXNHssUFKelagJ+mxW5kEWB+oP0PHStTwk3P5j7Th6vP2ovrvsR/ykTQlNZvWQn
         xQP6dbd4gGQeYG0t1twtjB5kCSyd1BMsPZTnQYg2r2LX3bdEymoTN6rE0C042jYXQIBo
         Jhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        fh=8ugIq8matvhUOuxrMKXM4DRbd7PDDOQldU3QunEtXfo=;
        b=a40q5S5Xeg/OXJZFftt0aGypPqn3gbdc7IdNB7vconHJpM3/iBuePxrBTZ1bH18t+h
         FNa9IkHWv9ia3vPeHmbQrgDa7n8VpB2S14WWqQcW9Qlh2IdxjZ3r7V+JdKyA0vjs+43W
         msMlgr6yziJh+cP+jMpxC0mVxtf7mNu72saWkw9S0iezcAnPyJqYx01JWbhe49jI2Jsz
         DY/PPco5DT8hXBVREmfn6bHciyyFTq26TRq3za0b/Hexye5s0/7MPpGFCtpMcpSHgKQC
         etJ1R9jiL+dmuzaeATy1U+R5pgDJMB207U7HuVXWO1rQJIi+VIL6A5MnBQ95B7p7GgxP
         H0hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775675240; x=1776280040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        b=s/M1AyMBB5e2sxLEfQIqfiZIyfUaXqOjICexrX0SKdAUsvVWMeuvYOoAhzBdTzf2bw
         xBJ63mSU5ZXelSXY+KJxR9nnf09ANhhECwVl9ChjBoM8tYLkC7UW0TZ5SxvIf09jYDsr
         G5aYsY18cigRVLX9clbT2C2AT2iw4bH9EISpbjHwK7QxwmTe7QUswV6kWMsM5f/Gq9TE
         VXOHPvVyOEaNYfNUguYhaeo+EmsbcgiIDzRqURQj3f20Wuj2wCgvLlgvvBrV+vIJL5rA
         I8iLoCEBntJkLYaTsHYM+YQd7KV8zIU9ETXghzvZ1jXz3pORohC320VpzOvuWXdpHUbI
         TRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775675240; x=1776280040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5MgGWh9XKK+ZjwM7NdPVqoY4t2PvZ9URXYNukPgpet0=;
        b=Zfsj1TZjegdAlJCINxfWLPiQzmLdawmROfXVrxZvGU4pUP5VsOA0CTWlxUZ0WrpkfU
         mNZq+6+dPsnL/a72hNW8bVvWExoo+M3FZD/HmDmrcQKhE2Dn3dpDDO4Q4zPz1fM/wfrG
         lmgWjdAvYigI+dhvCC2XEeIUv6ysBoFHn1oknA/wEMThx2VAy5vFqyh+3sOCODHo00fD
         jcPTyMA3Ld188u7dVGOag4BfdJLjWl7Iq5e8V22OLLkDauStHyJzKKjPVUhNfGulVLHZ
         pyUn07LnMBxsrh4JVG6Gs2BsP+YVkigS5vEV5okpazvLC0e1doyKXFedef2wbfqiuJmB
         DP/A==
X-Forwarded-Encrypted: i=1; AJvYcCWdeySQM54w9X64TOsYMaA9jZ1GCqlZ31mXdruoOMoE3JVL1ZzmWZ9HHWqfsqyy0rL5xHhagcPiql6IU9DY6l1+F6rk@vger.kernel.org
X-Gm-Message-State: AOJu0YwltSuCOHspRoAAws3p9yYqmBxRshkOdTO8ZcsBAYS8Pkdx2mAH
	Rxbp3KxEaTWYn1gCy3v4ebCK4ueTjg/UD67nbCNd7iUAGu3/ZqjEAYgifOd3axZgNVjSrLWEKqc
	YAtyLHKnhNC123a7gGh0NriR7xcuiohQ=
X-Gm-Gg: AeBDietB5y9bdt1QoTDVjAZZlFsx7/+1Y9VR/pwWLmZZDzFPYHwOuxMzKQLOoLYIQ9B
	Sy9nidV62yoM0U4m0bdJYUpEdSYyodcMX1a244DdjX+LtlmTB5VsfChRta8TkDLgkxcu5t9CnKj
	jVEpVqckx0UmfxFsemkq/bKgP48NtJNXjdy3SqHQJ0cW6He9zp2udbK7Mj9ukXzwNzYMs0A60dR
	rLzgRTymhYBABmGnBMXUzT7qXLgVx+B12ebR9NzzYWhY89lsvQaWEHKBSJ+31c7sxvGnwcI6pAK
	9263878pkdRMXpxBdxyDVtl7qqd/JD+VhDNEvxA/r9Lj/+vgkKin5J6P1rWjMIIr9uOaULoRKF9
	evRYXhP8=
X-Received: by 2002:a17:906:fe04:b0:b9c:7ba2:4168 with SMTP id
 a640c23a62f3a-b9c7ba2434dmr1035145666b.22.1775675240023; Wed, 08 Apr 2026
 12:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
 <20260407-swnode-unreg-retcode-v4-1-1b2f0725eb9c@oss.qualcomm.com>
 <CAMRc=MdWSigDmTGSCe-ggAC+rKcCLimKgKU_kAGh5N66jyXGtg@mail.gmail.com>
 <DHNVOVO67YMW.1Q763BB153CGF@kernel.org> <CAMRc=MchUSdWo=BXrYN-qS3YFer2R3J02HyJxKJje-a1QvWdfg@mail.gmail.com>
 <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
In-Reply-To: <DHO01A7B9M0Y.1QVVS8600WRJ5@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Apr 2026 22:06:43 +0300
X-Gm-Features: AQROBzDJGzBec5JWWeiqiBKbeAoL0ZpHkqC5pUPiuXH6__r4G5qXrWhTK62d4tI
Message-ID: <CAHp75Ve67JDc=79Ynp29wHPFA0s7Tv_cDcyrB=0U8Q+ydAifmw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 9:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
> On Wed Apr 8, 2026 at 5:52 PM CEST, Bartosz Golaszewski wrote:
> > On Wed, 8 Apr 2026 17:28:46 +0200, Danilo Krummrich <dakr@kernel.org> s=
aid:
> >> On Wed Apr 8, 2026 at 9:19 AM CEST, Bartosz Golaszewski wrote:
> >>> On Tue, Apr 7, 2026 at 3:28=E2=80=AFPM Bartosz Golaszewski
> >>> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >>>>
> >>>> It's possible that at the time of resolving a reference to a remote
> >>>> software node, the node we know exists is not yet registered as a fu=
ll
> >>>> firmware node. We currently return -ENOENT in this case but the same
> >>>> error code is also returned in some other cases, like the reference
> >>>> property with given name not existing in the property list of the lo=
cal
> >>>> software node.
> >>>>
> >>>> It makes sense to let users know that we're dealing with an unregist=
ered
> >>>> software node so that they can defer probe - the situation is somewh=
at
> >>>> similar to there existing a firmware node to which no device is boun=
d
> >>>> yet - which is valid grounds for probe deferral. To that end: use
> >>>> -ENOTCONN to indicate the software node is "not connected".

> >>> With Andy's Ack, do you think you could still queue this for v7.1?
> >>
> >> Yeah, that should work, but I have a question about the patch.
> >>
> >> The comment added to fwnode_property_get_reference_args() says:
> >>
> >>      + *            %-ENOTCONN when the remote firmware node is a soft=
ware node that
> >>      + *                       has not been registered as a firmware n=
ode yet
> >>
> >> This seems like a bit of a layering violation to me, as it makes it ex=
plicit
> >> that this error code indicates a software node, while
> >> fwnode_property_get_reference_args() itself should be agnostic.
> >>
> >> The caller can easily derive more specific semantics with an is_softwa=
re_node()
> >> check as you already do in the GPIO code.
> >>
> >> Can we describe the same condition, but without explicitly naming the =
backend?

> > Yes, sure. It can be something like:
> >
> >       %-ENOTCONN when the remote firmware node exists but has not been
> >                  registered yet.

FWIW, good to me.

> > Does this sound good and doo you want me to resend or can you change it
> > when applying?
>
> I can change it when applying.
>
> One additional question though. I think it should be fine, but are we sur=
e the
> change can't regress other subsystems? It seems some of them (e.g. sfp-bu=
s,
> v4l2, iio) special case -ENOENT.

v4l2 uses the ENOTCONN in the cases similar to this

https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/media/v4l2-core/v4=
l2-async.c#L744

There are two more, but they seem more about connectors.

--=20
With Best Regards,
Andy Shevchenko
