Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D9641C310
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 11:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143720; cv=pass; b=GWfgC0I/HTVad/8MqxNnqpfwDrO76UJdg2z5TXliFZ/3SquPGYBCX8P6F4gBy/mnlyWi+3fr/uEhum25XkYkapJVfuaOm2lDJfCy48XJliT0UfBmxVkNpzp9XdGsiZCm1JttFJ1y5tzFVZfTui8ZDwJEIRfXAZz+ir71BDoZX24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143720; c=relaxed/simple;
	bh=KJ34G7jXVW6vaVlUYzHj+z8DcGKlvG+6o58Yti9Gnh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYDZeKD9819l6gVmeYxqzRBBgmtgTuPdokfN+a8dbsNFHLbVJS1fJn+DLHT5CWyCUCoVknhoWPz9Ur0Pxpacz6PnzUTIHT/oN74oZcQopGL/JGpTljwcEs1HYQqun+WMY0Qfh18S5eDXdlxmmL9m+0AV86p0sgI6/LY7LCKCqsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6wKgHzv; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6wKgHzv"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so7455947e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 04:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773143717; cv=none;
        d=google.com; s=arc-20240605;
        b=I8vOwmu2JaA0qxxPPLgMHm5q7+OI73fkdfPVux1E9LM0efX7WmBXQ2UAnnlLgVduiV
         0AH5Cp10k3YRE3e4Gy3hby0LtzorqiNVdlBIdTSHQKXdc7NyfK3NhILHbX2Tm9cqaGzC
         s6BKwGlarTx0VGkaaO7M9FzBkyd5wQA0gIAEq+OLND5Hl9WxlA/ICQagI2snBZjEMU1h
         +rNBcg5VdTVRVbc58yIstXFp1LhFBnBShgPJeVcVMR8DdwfiSSfxoahHNBLECS4eDR2f
         aezfGC943i5CLumrkM7V3Adp6lLwfA2ZwG16hYz7TWVCvmZfgtGzZc8RZrCNB99Wpzb8
         F7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W70+Vn6PejFfPeY6VWdAiMcWtVOjKl21UuQnq+3EYxE=;
        fh=vEPli+MIlHs84zOt+64piQZffyeD3APYuO2wBnljCiA=;
        b=e0zVHRI/e/C9bOavCA4CeMeeRBDWSt6jLDK72r5tgrxfoxiy6LZWmO3uolhbLzq1yX
         JN0omZvNg5TLr49T3Dy4QmMC/+QY7snuOI34epu8F836lZ6JTPoFY51jJeX42V0Zq38f
         lphF58AYbcvsCS3rN2j6lZaHhmqHwFLh68mMRJv234axmfieLCL5H0IGfiyKwZTXVphn
         a67R10vhdgyllgn3/wRPRp7eKR1N5tcv3h18/rXF2o83MTMll8n8O6Q7sOFCKUfYgsgb
         IQBnuAMuP4gUZD4n84rWpbTYulHi7dzcPzlRBWc02kMyMUvISIyKVjQVrohWQmXqN4AG
         9ZUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773143717; x=1773748517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W70+Vn6PejFfPeY6VWdAiMcWtVOjKl21UuQnq+3EYxE=;
        b=X6wKgHzvGfZjbb1VVXQ4DqgxIlVZOJBD9U1LIvi4mW/O5C0P62KEy9HGblhr0BMtAM
         npdmJAQ9sUaSzeKYQ1R7qXnh++b6/ua7hVl4hFVp1dmMq8r0++Oqq097Q+rF1V+u8b9f
         otHVbs4H/CtAwLry9pjvlj4kY9oYBtNTzCy+mYpoBhik9xRHRdfm60SKlML/GENR9IM4
         0BfEP69xzxRmg967Xb0piwhVLFux37sZJGAPweJxGVy4HgQqwuCrKwgyKqaSdxhMgwXH
         5173A89GAwer+msqJZPK8tcuJETMTkmYKmMTjILAFDieO4nk2vyjiSx06I3cHXOR3ytA
         0/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143717; x=1773748517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W70+Vn6PejFfPeY6VWdAiMcWtVOjKl21UuQnq+3EYxE=;
        b=actj7k9NYkOSHDXjKSkX33/fNCJT2qT6+lkRSOFBWvEf8BXmtbdH4TSp3/pHYsXcsk
         Yjg4T4ti+2n6eXuBY6ukzGa6rNGPjgSaSzK4SwK8Z//FnmnAyQ951gfrZ/OE7yDq/y4U
         uUO/SkOjCSCSYPYIS7vZAZ909iEQXz+Wfqyt5mZA+/LM2po828AbYDKawBxZLemwqs9j
         +rihMjaYSG0qdFaVzjf0J7eX34m/wsbOQza/iol+dOywJs6MOpV+y5njoQ8m9WkKbeem
         8/JrlXSa2PqOG/AChlxBEkgBWnu1bpIMZGPAM/GD0P9nklh1MeLTHup2YcsC4tgERokN
         7TaA==
X-Forwarded-Encrypted: i=1; AJvYcCWudXFzxaXqAtyyvsnOSU8Maegn/l1u3Kr8vNh3h8zQGQea5gj2obhqN/urMXlKUjvAq1DNXnREPUOBejIejyhmsGeh@vger.kernel.org
X-Gm-Message-State: AOJu0YywLyFA0x9+S3WGM+kXOtKwymiS5IisLtlw5ffXMplG63L30s1b
	cImDbQOHSkKVMKrbCv37LivuCipkHncg6XnYO05gU7mICaOjnbel4g2lIOeGAbci+CQnLftpYG2
	4YoXTiIuVkW/Qh8MjCtC1QDfrSwgaNKYMCx1pxGx+MKWz
X-Gm-Gg: ATEYQzymcTguZtC3A3U3UeVteYJ5HWNnMvsxfgPGb+RVRVWetD+/qptEEfsbsfWgSYI
	r4tWb9WTzGregNCgX3zaFUdyUpS+OG7rcn1/526JncQaYdGCnruHvUawV4THlQacDKrWEPPGX3W
	mXptpu6n4b7u70r039o508Td+RjyIeT0SkjV27vL3n9CRdzv7e+zFNDJkteZ/zBmLg3kJAqv5cd
	Ew7Q7CPUtEhcYrZsTl+aa4sFp7xK+zHE68jVTD/1oK0Oxa1QzIjbcZnoHeD3K6pyajAOsLMY7bp
	/GDp4rU=
X-Received: by 2002:a05:6512:6c8:b0:5a1:18f0:930b with SMTP id
 2adb3069b0e04-5a13cd1c912mr4967420e87.42.1773143716734; Tue, 10 Mar 2026
 04:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-2-vishnuocv@gmail.com>
 <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com> <CABxCQKtf=RYrpgnbM0ODo3GA0oW3jgR=_erc9RCD6gEasasA+A@mail.gmail.com>
 <0df2daf8-31ee-4fe3-fc38-de138b302549@linux.intel.com> <CABxCQKt_1Hv2hPDpzQQ3TxFJWbRNHs-vRDi9hNhBq4oaoGkt3w@mail.gmail.com>
 <8216aaaf-bdaa-2a48-a7de-b0b81d49eda5@linux.intel.com>
In-Reply-To: <8216aaaf-bdaa-2a48-a7de-b0b81d49eda5@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 20:54:40 +0900
X-Gm-Features: AaiRm53Z7FInzVa7AHviwaQEjkqy6ucSeO9srFBPc2Ymkf_rnYJvGp7zbxxDC7Q
Message-ID: <CABxCQKsWtmM5zJDKM35WL_bvi=01QLT0ot5fidH-9yZ70_Q5cw@mail.gmail.com>
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

Thanks again.

On Tue, Mar 10, 2026 at 6:30=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 10 Mar 2026, Vishnu Sankar wrote:
>
> > Hi Ilpo,
> >
> > Thank you.
> >
> > On Tue, Mar 10, 2026 at 6:15=E2=80=AFPM Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > >
> > > On Tue, 10 Mar 2026, Vishnu Sankar wrote:
> > >
> > > > Hi Ilpo,
> > > >
> > > > Thank you so much for the review.
> > > >
> > > > On Mon, Mar 9, 2026 at 5:01=E2=80=AFPM Ilpo J=C3=A4rvinen
> > > > <ilpo.jarvinen@linux.intel.com> wrote:
> > > > >
> > > > > On Mon, 9 Feb 2026, Vishnu Sankar wrote:
> > > > >
> > > > > > Enable doubletap functionality by default on TrackPoint devices=
 that
> > > > > > support it. The feature is detected using firmware ID pattern m=
atching
> > > > > > (PNP: LEN03xxx) with a deny list of incompatible devices.
> > > > > >
> > > > > > This provides immediate doubletap functionality without requiri=
ng
> > > > > > userspace configuration. The hardware is enabled during device
> > > > > > detection, while event filtering continues to be handled by the
> > > > > > thinkpad_acpi driver as before.
> > > > > >
> > > > > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > > > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > > > > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > ---
> > > > > > Changes in v7:
> > > > > > - Removed unwanted comments
> > > > > > - Removed psmouse_info ()
> > > > > >
> > > > > > Changes in v6:
> > > > > > - No Changes
> > > > > >
> > > > > > Changes in v5:
> > > > > > - Renamed function to trackpoint_is_dt_capable()
> > > > > > - Simplified string comparison without sscanf()
> > > > > > - Removed wrapper function as suggested
> > > > > > - Fixed missing period in comment
> > > > > >
> > > > > > Changes in v4:
> > > > > > - Simplified approach: removed all sysfs attributes and user in=
terface
> > > > > > - Enable doubletap by default during device detection
> > > > > > - Removed global variables and complex attribute infrastructure
> > > > > > - Uses minimal firmware ID detection with deny list
> > > > > > - Follows KISS principle as suggested by reviewers
> > > > > >
> > > > > > Changes in v3:
> > > > > > - No changes
> > > > > >
> > > > > > Changes in v2:
> > > > > > - Improve commit messages
> > > > > > - Sysfs attributes moved to trackpoint.c
> > > > > > - Removed unnecessary comments
> > > > > > - Removed unnecessary debug messages
> > > > > > - Using strstarts() instead of strcmp()
> > > > > > - is_trackpoint_dt_capable() modified
> > > > > > - Removed _BIT suffix and used BIT() define
> > > > > > - Reverse the trackpoint_doubletap_status() logic to return err=
or first
> > > > > > - Removed export functions as a result of the design change
> > > > > > - Changed trackpoint_dev->psmouse to parent_psmouse
> > > > > > - The path of trackpoint.h is not changed
> > > > > > ---
> > > > > >  drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++=
++++++++
> > > > > >  drivers/input/mouse/trackpoint.h |  5 ++++
> > > > > >  2 files changed, 50 insertions(+)
> > > > > >
> > >
> > > > > > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/m=
ouse/trackpoint.c
> > > > > > index 5f6643b69a2c..e12d76350252 100644
> > > > > > --- a/drivers/input/mouse/trackpoint.c
> > > > > > +++ b/drivers/input/mouse/trackpoint.c
> > >
> > > > > > +     /* Must start with "PNP: LEN03" */
> > > > > > +     if (!strstarts(pnp_id, "PNP: LEN03"))
> > > > >
> > > > > Missing include.
> > > >
> > > > Sorry, I am a bit confused here:
> > > > strstarts() is already available through the existing
> > > > #include <linux/string.h> in thinkpad_acpi.c.
> > > >
> > > > Do you think I should do anything else here?
> > >
> > > Yes.
> > >
> > > The file you're modifying in this patch is trackpoint.c which doesn't
> > > have that include so please add it also there. :-)
> > Aaah, Sorry!!. Got it.
> > I=E2=80=99ll add the missing #include <linux/string.h>
> > Thank you for pointing it out.
>
> Thanks. Please also double check you added inux/array_size.h into the
> correct file in case you were confused what file this patch modifies.
Thanks, and yes =E2=80=94 I got mixed up earlier and checked the includes i=
n
the wrong file, which led to my confusion.
Sorry about that.
>
> --
>  i.



--=20

Regards,

      Vishnu Sankar
