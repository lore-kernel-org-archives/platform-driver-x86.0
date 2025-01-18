Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A38837;
	Sat, 18 Jan 2025 00:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737160720; cv=none; b=lH/QhhTTAWT7XOxghW//RRnxqbj4XCZ/8rI5JXsztBvtxX/QOQMgbpFMn0yXu9WO8KPHw31llo8Aut2XAdS77wfEKO8GS7HlcUZha9sPFwIu7WqPyfsoIeXYG8XlVC9wiNhB9EfgKXTK4JBv9pXi2DutnbTkzJVjN+jyLsr/xMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737160720; c=relaxed/simple;
	bh=Xpoty69Quykm3yC03O8l8FB2Z5zB6OFggs3iT3XMYdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyB0m9LzV1mEBlCIP4gKLnTipIqRHkeDwXksEehXCiQWorhVGwCyiFAG57lWTVVidvp5oy0LV4JWdS0UtbqMcUmZU9OIwazOSuPDxB52w1IFF8oIvR2A3+q85/Bp4abzmWqulDs7UVxNegWa+9/s/GZqFua1PenvmF7c9sRgjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844dfe4b136so74657939f.3;
        Fri, 17 Jan 2025 16:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737160718; x=1737765518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAjxAqzEP77QfCh1aJ0/pJ0I8ULJTrVDP/GR492qy2Q=;
        b=fbod+JfavK48flNjwyAFvn5bbyGvhzgjRZylMbyPxPY39/rT2/Kstc5BkVG8N6R2t3
         hxDLH5aCwq+ROKQXPZiTdLEbpPwgSTNktGKAL9S4Ejdw1j7e/hioGKWvcE1+v2s+f7yo
         k/CZoe6CnDr5SHGNPTSAWTcaN1W9OcGQ0wHvp/rqgjibUJ54dgMEMxuhNeoT8jjIwOLQ
         eUTanm4/bEULAZMMuu3A0haLQdrZBTlqm9O8nv7k5ehMujn0UgQXi3Ko4Kah6iBom9/g
         7BIbj3bTvAuFESqJjvyftepidA2c3FCnjKz5/2JmIcQCew0g8Q4CUzWGUhXcnvGZNcQc
         ZTmg==
X-Forwarded-Encrypted: i=1; AJvYcCVkx8n0wEMpmHW6uH+Cc4qsAX0vzTYkRHAZ1uF45ZCunSSCNxATTn1YVJkUMrLYzN2lGfS6uJRERnROyeF/@vger.kernel.org, AJvYcCWB+nfKbTl642g4vTWViyD3Wi6+V6MO4TzZmeiP1VLv2F5GEWrawlGwfFT+JatgVr8B6irooJktLxg=@vger.kernel.org, AJvYcCX+qMGwiP49YxwX4QzuXVe3e7C7wHgAe7Bb1VYvbNXI4z6WTw2+t5aRhmZyRPpwNRMT/NLF0wdOz69lZzQ9JvZwt3DlBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweNd2JvFXrv3bpd16f28dJANRYVlQodmbWpMd17O8z2dMDCaxy
	TZr+8yuiIFsSwVxeLghRjVKstzNkT9KOEyAjoSLwwDs/wEZm4gfVC6IWaeqg2WI=
X-Gm-Gg: ASbGncssxlg+4hgOU5V37QRf4PE7KCg1LNsDYgQmQYm233L8AisbtLAv4YgBDPo3CcF
	Oda9koaFTn1ICQ5mSXvd8ZqF2c4Vq2AxsVErZmIWgvei8Auj2NKl2dYcsUdN8v138FnjwXsL/2g
	sNBypUt8czIURIKD0K9xdmExBdT0dK4X98615L7Wcmmtvo3jkjUhd3EyuWkWVbAYswN5Jbm+fHE
	1JwSascgql4PXpadOzvEacXxWiHb03cKRBo10SzU1ZPw/cSrpIsVSAtnMezZlvK1dHdfswhy+A7
	ZyJu0VXajREQ6nZ9ys5OtBS9xnwtNYI/6SNarCQ=
X-Google-Smtp-Source: AGHT+IHOYPNZE1RQRYHetCtS1RRr/6yVZlAbQ08w7G2LAg1d3GNW9s9Pm0Ie5zXNMPAwRwqeQSeQLQ==
X-Received: by 2002:a05:6602:26c5:b0:844:e06e:53c6 with SMTP id ca18e2360f4ac-851b64f7425mr390203839f.11.1737160718030;
        Fri, 17 Jan 2025 16:38:38 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ea753f6f21sm897757173.21.2025.01.17.16.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 16:38:37 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3cddfa9a331so10001155ab.3;
        Fri, 17 Jan 2025 16:38:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1v4uNB6eGo9RRlKX6RmKjvwNHT5lHGo4U4f6uH/G/JJwdNYEtFXEyquZ1kFgZAw9Z+n1wpKallms=@vger.kernel.org, AJvYcCVgMw472bk9EDyv5Ep5ftnW1B4tiOkVERwGVbxsOJmAuo3HG/s3+1gqj2yMX2m/s5zVKwp8jOd5w6ijNTi6@vger.kernel.org, AJvYcCXKkl1fZPnt+0aSXpvnZCtaOOVJdC8qIybafgodWZx+e83waUlc3mn+yd3tA1OWeIVEtkwoHKP41YvosiVazTGm1NcssA==@vger.kernel.org
X-Received: by 2002:a05:6e02:160d:b0:3ce:6b10:1805 with SMTP id
 e9e14a558f8ab-3cf744947c2mr40357695ab.21.1737160716797; Fri, 17 Jan 2025
 16:38:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112150910.13489-1-josh@joshuagrisham.com> <f91b823c-593d-dbdf-e453-878e61f329ec@linux.intel.com>
In-Reply-To: <f91b823c-593d-dbdf-e453-878e61f329ec@linux.intel.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sat, 18 Jan 2025 01:38:25 +0100
X-Gmail-Original-Message-ID: <CAMF+KebFL_9bF5UE4Pb7OQsQ6xJ6vWUXu5+4SWbnteVP_xOyaQ@mail.gmail.com>
X-Gm-Features: AbW1kvbaWJNPMqt5ycP28dqzHbGTkXdYgWQq-IIGoxtsiuWHfRpZIUiC7Krdk38
Message-ID: <CAMF+KebFL_9bF5UE4Pb7OQsQ6xJ6vWUXu5+4SWbnteVP_xOyaQ@mail.gmail.com>
Subject: Re: [PATCH v6] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, W_Armin@gmx.de, thomas@t-8ch.de, 
	kuurtb@gmail.com, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo!

Den fre 17 jan. 2025 kl 18:36 skrev Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>:
>
> > +     err =3D devm_platform_profile_register(&galaxybook->profile_handl=
er);
> > +     if (err)
> > +             return err;
>
> As you might already know, I've in the meantime merged the Kurt's big
> platform_profile series so these need to the be rebased on top of that.
>
> --
>  i.
>

Yes thank you! Actually I see that there is also an update to
firmware-attributes, i8042 filter, and platform_profile on for-next
that all now need to be implemented in this driver since the v6 of the
patch was posted. I have a working version drafted and will send it
shortly (along with the comment folding and spacing requests you
made).

One question and maybe more directed to Kurt regarding the new
platform_profile interface is that (similar to how I did it with the
above v6 implementation), it still feels cleanest to locally track the
different "choices" within samsung-galaxybook since it can vary
depending on the model, and this get_performance_mode_profile()
function needs to be able to evaluate during runtime what choices are
set vs not.. so in my draft for v7 I have opted to add a private data
member for platform_profile_choices and set it up during "init" of the
platform driver pretty much exactly like how is done here in v6, and
then during the new platform_profile probe I am just copying the
choices set from the private member to the choices given in the probe
callback. I hope this will make sense but please do take an extra look
at this when I post v7 and see if it looks ok or if there is a better
way to do this (again keeping in mind that setting/getting during
runtime will need to be aware of what bits were set up).

Thank you again!

Best regards,
Joshua
