Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6C43D4E3
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 09:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773134530; cv=pass; b=NfVReigcgVRuMio66GSBhLpFa6AiHcUxJuQQvkDQF6Fog8Z3FZvYCxkPPoMyQ6ug4gnwl6HbmG3Nipxd16vzcmO6gD00SqESPCQE5nH0EByK2Ql1ra4HSzTvoG+EWfljXYg4VrgN+ITcAWBOE/qvZosXpyll80HinwtdqtXSsZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773134530; c=relaxed/simple;
	bh=tl5/g99NELzOxMGo409f19JuxHQ2pLmrUlfv8ogw/uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McV+Dr9fRG7NThTRN+A2wc1kpfoQnBWCCWvK3t3d9TrNhDFryzXIOs9Ls/eYdN0TlwyOyjbXgHV+WpV71kFs76MB4NkYlHTkZfbchTxg0WekPNy/QYtGNotKIjZHS1QYiMdCFMfN1vMXCjQIPYmTpTj1bNgCYEUWZ7NSxunRb/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwPL/Evq; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwPL/Evq"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a126b79512so5213791e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 02:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773134527; cv=none;
        d=google.com; s=arc-20240605;
        b=aoVOP6cp8s5A0UjPHZMlsmVJ3evRQxfU/Lg5U0bMiAGcnTCBuWFo7nxIxSoaLU80ly
         m8PPY63OzCJ4ZWIs9bQqmu2H3wKzobmroaO5ZK/+ALXkfUMV6gUvlka+2tN+7WGPP5Qd
         HzscJRNr7jw0OFMuKo3Du8Mz8QDdYsIiDWtnuY5qKdVIiXldoycUgVEB89jeQmytfUNF
         mvNSeKBQi7RjSARj6Adgrox43T+YZmoy5CPsPd2PBrPhGZ65ip9ypbAY4gedPwyhe4QG
         BXRo30wL5IjnYkn7baH2lulaToJmgq4hpQUSme7+d0yhvUiynyQjL3CautWWegMKZIfG
         fcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8fpTI3vdEJL+Z4u+Q4DZneNzvVwr7TWL4qTU3qawv8Q=;
        fh=UQEONPDoRbs4kxfl4exLnGUSEFzjvpL1jeSb6apbdFU=;
        b=lOjFuYSpk6PwqRVY3DSvYTDkAT3cK8A/KkAlac3aqFx3hNCEJVrIJrwAK0nUThfCDr
         /ITwsofdwoDFDzNZR/L9UYcO5sCjt7v+DxUfMLdZ1gqW+FCMuW/ngn/KrMTJrhH8owE6
         TRFj3p9dpj2RhSdMxmZyw4obM5wq5YzI+uRjzu9mQTM0ebmj1Q2rF1zFNHl4BsUv9uEZ
         PiZHXQ2RutUF6lPaeaBVFpP6EIIqqA2MwarEOPgvvOGtfdCM444P4lKYk3DWkCDwK8Ls
         MNSU+KBvo5TESV+xvxNe3LcfZQq52f8gEhI6QYGLmwE8ky8goqFrM9XBATnb4WQoNBEf
         xktA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773134527; x=1773739327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fpTI3vdEJL+Z4u+Q4DZneNzvVwr7TWL4qTU3qawv8Q=;
        b=bwPL/Evq+eoeHEke2+3CCTMUTkJrW502WokNIAE+vXjl0wyTEGRuTvhUkoyF4bMr39
         ZL4UjOhSKK3VSVI88rSCaNCaVzFzwLSb79OBIOSbrkTJ5vHTL7Do8ojXXNzQ8kUKrxU0
         IfFzOvabzSrLHkGVxHwbWa6/ZBfwGnMAWvcITUhTlD0tH7K9cWHXmMSWZTPSHhpEb3hy
         JwqldQaPzrSuBsg8Zvmv5+AAO4NvynMnL4Rb7wKNqik/LGD6SYfMEqhOg8wMhS8TW3Iw
         gGPjwKIKYqgLrPaWneYjC1rYwKrU7V/oGzznSNqj1t65BRnv0ePLBU+y8F6V7KNgyR6W
         Qi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134527; x=1773739327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fpTI3vdEJL+Z4u+Q4DZneNzvVwr7TWL4qTU3qawv8Q=;
        b=VlIvlCUZQek441npAYlxk55iLfbynGh+8Hr8o+NjYvB0i/EIwfX1iYu6nBeAmUkETG
         9rmB5X8USNfeRm+2A+aUjNEutSg1N6xVIQ5K42Mc4jdgVMBakBS0lJF6ogm3XVDUbvPy
         +UxchlQQ0Waj9sjCgBgNZP5WHQSqnn7jQ03o0a2qi02X3T/9OVhBybcf5Wjrdh9s4N8m
         qQ+63gkfU82v56gD05gxW5ANxCbJ/dQPfK4Bk4iqrBmb1/mwCTNYUHT6853efxOasHzj
         HxQ+EC1zuuBYaKd+MSaC+Yfhn+3s7pvER0iMYJYgxKWV6JU9by/ABqF9p9tfWS2U/PTt
         t+ig==
X-Forwarded-Encrypted: i=1; AJvYcCXpJkQ2wGc5hV6IH/6XkRBTOouDSRhQKRW85ioffweahG+x3AkEDtYNoAWhsn1xhp+uC1qr8bG4IPPT9cHmt2zVC459@vger.kernel.org
X-Gm-Message-State: AOJu0YzCKn/AjS4qCSgUeqGbYx/EqLc9Ibf+8FmwB0BhZttfP8aUHxTR
	xB9vHN2527tGCpNDFr1k3vi/R3BhLMtkMXYoRuIx7ByEHLR8q5UEjhQ+N0lSmeMnYc+buzNzmtS
	6iE5GeqYIsz/LK9rZKHHLPZVVnvXQor0=
X-Gm-Gg: ATEYQzzjVFX/BU3Z3OX7y3u0n9w2SWmDCfsK4m/BNeHhKnSfn39SJvXUZaqc9tdUWE3
	OAuMnv2VtO0jUuvs7qkJHq54kLThppRqzK/6LO1IGfp1LDMJ3DeCqMjkVabCOFcFMAhFhpf1MBu
	W6xz0xA3b+C/RBeqton4KWwjHp8feLtf4F/o1kWqUordbnEa+rttCaVq1O41lfy8RotYLv69oSB
	JHadT7dTnsDLZ908c2r8iIZEnZJnFc+ws3Zwu8oWAS4C9jwizsLsm6ORwde5ocY2p8F1mqD0UQS
	+X4myeg=
X-Received: by 2002:a05:6512:39c2:b0:5a1:3d47:1308 with SMTP id
 2adb3069b0e04-5a13d47160amr4958370e87.31.1773134526632; Tue, 10 Mar 2026
 02:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-2-vishnuocv@gmail.com>
 <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com> <CABxCQKtf=RYrpgnbM0ODo3GA0oW3jgR=_erc9RCD6gEasasA+A@mail.gmail.com>
 <0df2daf8-31ee-4fe3-fc38-de138b302549@linux.intel.com>
In-Reply-To: <0df2daf8-31ee-4fe3-fc38-de138b302549@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 18:21:30 +0900
X-Gm-Features: AaiRm511VEyn4PbFLInkP2GfrKMqwBNJnODO-jlyMYwiozSyz1gLdW_tLl1yvUM
Message-ID: <CABxCQKt_1Hv2hPDpzQQ3TxFJWbRNHs-vRDi9hNhBq4oaoGkt3w@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] input: trackpoint - Enable doubletap by default on
 capable devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	Hans de Goede <hansg@kernel.org>, corbet@lwn.net, derekjohn.clark@gmail.com, 
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you.

On Tue, Mar 10, 2026 at 6:15=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 10 Mar 2026, Vishnu Sankar wrote:
>
> > Hi Ilpo,
> >
> > Thank you so much for the review.
> >
> > On Mon, Mar 9, 2026 at 5:01=E2=80=AFPM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Mon, 9 Feb 2026, Vishnu Sankar wrote:
> > >
> > > > Enable doubletap functionality by default on TrackPoint devices tha=
t
> > > > support it. The feature is detected using firmware ID pattern match=
ing
> > > > (PNP: LEN03xxx) with a deny list of incompatible devices.
> > > >
> > > > This provides immediate doubletap functionality without requiring
> > > > userspace configuration. The hardware is enabled during device
> > > > detection, while event filtering continues to be handled by the
> > > > thinkpad_acpi driver as before.
> > > >
> > > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > ---
> > > > Changes in v7:
> > > > - Removed unwanted comments
> > > > - Removed psmouse_info ()
> > > >
> > > > Changes in v6:
> > > > - No Changes
> > > >
> > > > Changes in v5:
> > > > - Renamed function to trackpoint_is_dt_capable()
> > > > - Simplified string comparison without sscanf()
> > > > - Removed wrapper function as suggested
> > > > - Fixed missing period in comment
> > > >
> > > > Changes in v4:
> > > > - Simplified approach: removed all sysfs attributes and user interf=
ace
> > > > - Enable doubletap by default during device detection
> > > > - Removed global variables and complex attribute infrastructure
> > > > - Uses minimal firmware ID detection with deny list
> > > > - Follows KISS principle as suggested by reviewers
> > > >
> > > > Changes in v3:
> > > > - No changes
> > > >
> > > > Changes in v2:
> > > > - Improve commit messages
> > > > - Sysfs attributes moved to trackpoint.c
> > > > - Removed unnecessary comments
> > > > - Removed unnecessary debug messages
> > > > - Using strstarts() instead of strcmp()
> > > > - is_trackpoint_dt_capable() modified
> > > > - Removed _BIT suffix and used BIT() define
> > > > - Reverse the trackpoint_doubletap_status() logic to return error f=
irst
> > > > - Removed export functions as a result of the design change
> > > > - Changed trackpoint_dev->psmouse to parent_psmouse
> > > > - The path of trackpoint.h is not changed
> > > > ---
> > > >  drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++++++=
++++
> > > >  drivers/input/mouse/trackpoint.h |  5 ++++
> > > >  2 files changed, 50 insertions(+)
> > > >
>
> > > > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse=
/trackpoint.c
> > > > index 5f6643b69a2c..e12d76350252 100644
> > > > --- a/drivers/input/mouse/trackpoint.c
> > > > +++ b/drivers/input/mouse/trackpoint.c
>
> > > > +     /* Must start with "PNP: LEN03" */
> > > > +     if (!strstarts(pnp_id, "PNP: LEN03"))
> > >
> > > Missing include.
> >
> > Sorry, I am a bit confused here:
> > strstarts() is already available through the existing
> > #include <linux/string.h> in thinkpad_acpi.c.
> >
> > Do you think I should do anything else here?
>
> Yes.
>
> The file you're modifying in this patch is trackpoint.c which doesn't
> have that include so please add it also there. :-)
Aaah, Sorry!!. Got it.
I=E2=80=99ll add the missing #include <linux/string.h>
Thank you for pointing it out.
>
> --
>  i.



--=20

Regards,

      Vishnu Sankar
