Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752B1277029
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503922; cv=pass; b=B/V9wJa1pGZo0iTZQY9t5vz7sBkJJA3MCgoghCE5S7h9pDNm2lFyBS1bi3ZfoFWW5OhdToIYA98rSwStKH3v0c7i++cNgKqD4ADp7TLKYzafBRM9kPsjm4KHPEXTkjwR7EO0Ov37BDr+tIVUJVLW6NWAl/G85o5AIPQ3MxIE9Ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503922; c=relaxed/simple;
	bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOvThVpup2mwtEuVoQxA3JSlSMk3ygV3FOe8omfFfxYfv764XaAhy0YHMA5bHqSl0L0UUHCTlNTC9hdLp1dixpHpJZisBgHTYPahvrZQndCFi8skQGrWZhG9AapxrpneQhXn7QODgV9tJFejlDFMKVvHLWYtgj/Z5WT1rdVUsH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA3kyBNH; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA3kyBNH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso7092213a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 12:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775503919; cv=none;
        d=google.com; s=arc-20240605;
        b=OJdM6yYn02Q0xeHS/b7VX6tfJVpcHopM61J5S6/nByqRjGgYnz7xpidN+eNtxGfhIG
         TYA6nQ4/f9DcM+2WEmykwjf035ZHV6LYQ6bQaQ6taNcmCM+3F+vHyQ597V118SfkBdcC
         8QiKFMnRQTYFLK2Ii/BrA8p3j83tt/y0o3/YGRhx63E+sWuH5r9m8QTg03ol3T13mvmc
         iNRllTEKVseo9MUgHC/eEnfKvR5rQrPoa6ff6BGVXdKs3TmX2hvgW+lwszeO7CsR0Jwe
         Qhij8nTZDEQS/N17v2zN2YCOBc5Nv1qZfElkk0q2Op8fDdyL6UDm38NdEqc7ULUo7ISq
         WIeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        fh=gZLFnFqCpcEoex+0fIhYQULk/uyS/J80NDOQEyI9hBk=;
        b=HbuTy1FvWcpGWHdSMnKwm+b1Qt7k3jaLMWj7dT8iVaNaKovY9pQhNVq/+E6o+S9UJ3
         wS9vneWE9DB0K03ru69a+KYFiIgavLCxuvRClQepA3pbIScE3CpdCw2XF72iYMMK8LmJ
         Abwgg4C7X5Ssb1G49XVlwYGQNOK4KCD9McLEVbKrDpWVfZ6t3mELeqhf24FyX/BILU7A
         /MfGAV0YUmfxhys49fE5+ajpFwc8k+VlXGVoOnwqYM9gGmZ/HeYOb/3xDFEAswvDSBSw
         gvPIeQPa15vsUEO53AEK9wZh2Crd4Rq1vIogfugW6VPJQqhsNEkn/eKydjjzHGNF5sUz
         pG5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775503919; x=1776108719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        b=dA3kyBNHclM4Ez/APobjWKyaK3W5bJL4bLOsg4CRJ76I7AcKq38GlG29bWbM/U5+PH
         APWM+YSeNP6h0WNdexoK9v5az1CaQ482iGJy4iHliQQAqHo//7VefoFUyB1Bqce124N/
         Na14l5xU7kBReh1xhamoAkNqBq4H6sg9QhNrSb+84Q6FbE/lhgAD60Jt2JVr4g5jDtNU
         bx6hL8fJmfRYOi3kSIWOL9d8MgO4IuDftSvF4gUCXobV8XnWZVpwLFmltr4WpF4C1qzd
         ei5oXE8Cq5GKQSK08C5sz54J6fEZlD5Z3VM/zp+93WbQp0RkcMItGmPUkWnK29NZ2dhP
         xUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503919; x=1776108719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        b=Zo5Khy6fuNljayDQ5NE+/ErY5g80+yw51ItPRjMHBv+TE+DSMbBYVjlG+m7XR3lx16
         QainjF5Etsvr3kDbB2NDMU50p7czYFWRVzXeICxBCDQDN3jcwXeBA6AcE9HDeVVFFwm8
         thZUXUraLDZywogNVfd7PIWAmH2QhqV/ynhBvaPZSb9sq/+OWYV8JtavjQyFnr4GhzFI
         pxu5uWXpUirs01IMcd3OqXXgRq96wwXoD5+d05Ij/aEH4/YLtrm4uI4qxY4fKLamk7wP
         v9JuLVUXDRQT6CWHCeLZZFnpy6C3NbSJJgcKNbTTae1gQRbAsx1oPNrSGnFMEEXM9u0j
         fe4g==
X-Forwarded-Encrypted: i=1; AJvYcCU4RrPg06HYwiwqUB/kKVLY3HRGAYfJoub/E4FHLaGDB/IKf+TDDT8G/L3uuCfAlX0XjNB67j7Bu/FgcadeV6pMPWAB@vger.kernel.org
X-Gm-Message-State: AOJu0YwBI7SCj7ToN/xl3NqN4kVx7d10sxReP45Aaw9GyFrnqfg/abbK
	jj8bu49NiMy/TYiUhTe/b4DO7rMuCvhgNX31u2ZeLjCTepoCt1+rjPxtPIWwaVUeQrn3hWl6gw0
	6/MHESS882zQ3zqOObQW02VWbNZ3dfuU=
X-Gm-Gg: AeBDieu3XVDSpvwBenni6yReEZkE1hEpc4zTWRlCAgQ1MfvrGoF3/AH/RfOU0ChrVkS
	2l+b8yqBAQmvbe584hM8Jd/omRXWt4UaPKGX72x6M5XUETyM7VDh3HD82d9ALT00NH0VDLrA2h4
	qZyaymSQ44Nb9zqUS/SvZ2dGEtVCIjUUMBjlNA5neCgUBLAACimHpQcSXFozi4ZZ036lUy0Orke
	42Jmh8j9HG1+PhCy+rcWVUmVF0kXl09G834bbfwGaz257pXzfppXyglNVb/hUJImCflSZGW/5WC
	v4vG1UvbP8kT3LUF2fIOyub+cRYa0mHJg0yHZtQGyUk8gSKLB5S+xVCjyLNRrkGU0e/jNRVmWdn
	i5L4Ffeo=
X-Received: by 2002:a17:907:9407:b0:b90:b959:4c72 with SMTP id
 a640c23a62f3a-b9c65596656mr612539466b.6.1775503918392; Mon, 06 Apr 2026
 12:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com> <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Apr 2026 22:31:22 +0300
X-Gm-Features: AQROBzDF6KYTnuyhLB-pMUEmLRfSC888lHdfiDN5w1084rUmzr9JPBFEahloXWo
Message-ID: <CAHp75Vd7cs8tF1vRVFNmXsO0X-cgTJ_Ua22+KigdsN8Kpf-Tyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 4:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> It's possible that at the time of resolving a reference to a remote
> software node, the node we know exists is not yet registered as a full
> firmware node. We currently return -ENOENT in this case but the same
> error code is also returned in some other cases, like the reference
> property with given name not existing in the property list of the local
> software node.
>
> It makes sense to let users know that we're dealing with an unregistered
> software node so that they can defer probe - the situation is somewhat
> similar to there existing a firmware node to which no device is bound
> yet - which is valid grounds for probe deferral. To that end: use
> -ENOTCONN to indicate the software node is "not connected".

Despite being mostly for networking purposes this error code also be
de facto used in other contexts similar to what we have.
Acked-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
