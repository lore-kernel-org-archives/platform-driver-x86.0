Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422C3BD64F
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Mar 2026 02:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108746; cv=pass; b=nZgOWypq88CItSsx/9DgFzcG3g+vdTLiroP2x1NxVNP1jujQE3rWkl74EtqchkTNeRg2fJXBVeMM43lbqOxyVIe81HxzG7pv+6qIRdVdRsL3Gog8SGHVYmJFHf0Xll/aPf3a/DrfU5OZyp4W4cChYC3ddr3zUIxPz3V86hI61PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108746; c=relaxed/simple;
	bh=qInFR7+ruku82QTeduGJJurbtW8DPI5C9OdU4RWav24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXAxIYuYgazXZUXUOJrnJZzo6zIom7tywGc2BfveoxSy+Gwt/M+un74aB2WbzK7NapTPJ5QHHqX1CGZ8Oc4vGvyOqa5Qcv6u/eN95Tf0zSzm+PaS1AcLkEtWSjkm0KlA+rLzZpMVChVoe3ezgNxRIfhdD6pYTD/JgORtCV4b9aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaFVSkng; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaFVSkng"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a12f6871b2so6810943e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 19:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773108743; cv=none;
        d=google.com; s=arc-20240605;
        b=ef7KQN/kYDpGkPDfXdz+6+htobVZdaeqRNod+/ePd3GBERvfhFSP4qOISTo9qApdXd
         UjODmGyI1q5gZt2GvwBPC/KRb0IDxqjZffVw2wiQi5q+sQvpDKxLiFv3YK4PtGpjAdCS
         XuaQUs+BXTXAg8Kv0pCCpGtm09a/3eKr+PHTnYaoXepM1j4cOosSE0V3DZ2m0sISGTe0
         FB7lmxNdiatPjqkGOACpMgrnXZCtlvZmasjhxkXmt3bN1tAl5FyveZX9qvbrKnta5yn6
         l/yUIQvT9WmpYI9aZHIwlk3ffHynfXmJExnAbCO+3ccVwfwFmp1WVctO7BpgTsVJSxky
         7IUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KtlsLU3IPO5uqXUZY8olaTkPpadXjE8FCVLC/ftGY8Q=;
        fh=nC63/3b6XM27PJznhq4tIgvh6CF8skyDvejZZyzU0xo=;
        b=Y+NUAIDqDYLB2tV7kO/BET69l8M6IkFU0lgXJInwiWeX10DcmSSWRlQTjoxw7SV+X8
         jlPb4v71ftUYjddST69uNM8g+dH5Suj+jLIxAp4urxm8JHu+tKCVc1qBoDbbPx2HG4D1
         YgGJlVUHcPXochNNCNUygbg6nrJw9ISpREzk/1M9xkwchhnAVJbsaQ9SeoU5VW+6dUhI
         /sZRIX8vx9fY6knaNlSYX0kgph9P9qhtHrmJbCy3Z6gzi2OcVSdjBcSMKcAR5sqsl/jx
         tKqUb16YZPC0wX2WApWSMeemTktVQVz6gZK/o0NkZyuE4ouPunFMdMWX5rqvZN/fZ/MU
         WOrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773108743; x=1773713543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtlsLU3IPO5uqXUZY8olaTkPpadXjE8FCVLC/ftGY8Q=;
        b=NaFVSkngboq1hHClKBNqJ3FuhfV0ZssRBy4ZTnxtJvCgURRChosdINNJB++x8ET3ew
         AeiJ9xDiUY3byUaJbIGDmTTouK4gaXztLmfSw2Q4x+0sT4erJvvUBqU6o48Z4nWge674
         DMJQyu4T2bHoxPwaxPMjKUAdQD90AYzZmPC1BG3hR16BkuV8XvI9x15N5rZLJHj1oja2
         rbjIMuAn4xF+Q/57f15taFtBCwjNmlqO+e86ppNn7h14IRC9guKptVhqRYR8wiECu5Ri
         UhWrk7lnr4hjxi2XPVMpmLmyaVL3H4yaZJSFSVUDfn31jM8VJh0+RRZonxU00LgWCEdL
         bzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773108743; x=1773713543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KtlsLU3IPO5uqXUZY8olaTkPpadXjE8FCVLC/ftGY8Q=;
        b=Q/wD/aDeMoCOScBAcWAKgVp3UoPKDMmhlRuXh5BmrhKTPhETgmMEYllQ2GimoPWbfq
         mvkfSqi0O5aJGN2Vsw/3bWSvHzJwe/JnJXpfKUJaccwO6qi2WcFT73CMv3I8KiYH6YEn
         SSH72tVGBzkZDe/75dLNpHx9bK1Lv3RIp+JGMz/CPlYa87eCUA60mageu7MYUaPPtqUC
         QNJEjCB1riYdr9WtA0lAghVTWwRJb5qiI/FWjFgU4gbGY+neltprPkHPV5eA/utJh3TN
         +ffZ+f1iMVO7+EThq2s3/GZRHFKrSq4pJ4e6zeUMqGKHJJSVR51kBlchRrPdmYwz1jj9
         zXYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZaRv4E5yPLK1ZWMS/6iPgO3Og8OImx7Byr5dKjKhgdjieadaMMBAlnhk6+dGTqf0utcM3XbWJr5LSkDEY1M4FV3Pd@vger.kernel.org
X-Gm-Message-State: AOJu0YwbdPU4P4KNSsPccTXXSfdKGXKwMUyvSL+Bmwot9gyHFdl9uTfh
	e5qU/410j3aiAq6F9/woWou0c8rgqTYT4qmKy75berI0vFpQ/rnOySg39f9vx4jvHBFsFZr02kx
	Lw43C0Pyd4KYebMEu0gHu8mC46H+byXM=
X-Gm-Gg: ATEYQzybvtltul2jKMCbF0kBmFW8rflynXkhyRqGeBcZ0eClO/AB5Xzd3Jt/dXW5y9f
	uYvvcAVhByeeT//bmXxYgWxlhSZDOVRYeHokGg3sbBLOfQUT3k8ICZGKQcySwo0hevsIC/uPgy2
	AeOYsMl/Fxnj5EV34W760SVbE4QKBQWvRnOSbSl05/UwQ2wuw9UR9/8n5UTT13MZvhMzTRjkIq9
	d8Bm/3iaIcZmGcIx/doCraYq3+AsUmSRyiUk1+Yxatf9i8CLh84/JwRAc4dNs4GmY5QAahy4+9L
	No7qAKKg37rYCyE=
X-Received: by 2002:a05:6512:640f:b0:5a1:2fcb:1da4 with SMTP id
 2adb3069b0e04-5a13cabad88mr4615178e87.11.1773108742407; Mon, 09 Mar 2026
 19:12:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-2-vishnuocv@gmail.com>
 <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com>
In-Reply-To: <fdd1d48e-61b7-2543-8a30-c7ad416f5dd3@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 11:11:44 +0900
X-Gm-Features: AaiRm50mcZVhLubnwdp-BsgTf6noF_Wn1o5ArrsQT_Cbsc-4CO86otqEZNqhq_c
Message-ID: <CABxCQKtf=RYrpgnbM0ODo3GA0oW3jgR=_erc9RCD6gEasasA+A@mail.gmail.com>
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

Thank you so much for the review.

On Mon, Mar 9, 2026 at 5:01=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 9 Feb 2026, Vishnu Sankar wrote:
>
> > Enable doubletap functionality by default on TrackPoint devices that
> > support it. The feature is detected using firmware ID pattern matching
> > (PNP: LEN03xxx) with a deny list of incompatible devices.
> >
> > This provides immediate doubletap functionality without requiring
> > userspace configuration. The hardware is enabled during device
> > detection, while event filtering continues to be handled by the
> > thinkpad_acpi driver as before.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > Changes in v7:
> > - Removed unwanted comments
> > - Removed psmouse_info ()
> >
> > Changes in v6:
> > - No Changes
> >
> > Changes in v5:
> > - Renamed function to trackpoint_is_dt_capable()
> > - Simplified string comparison without sscanf()
> > - Removed wrapper function as suggested
> > - Fixed missing period in comment
> >
> > Changes in v4:
> > - Simplified approach: removed all sysfs attributes and user interface
> > - Enable doubletap by default during device detection
> > - Removed global variables and complex attribute infrastructure
> > - Uses minimal firmware ID detection with deny list
> > - Follows KISS principle as suggested by reviewers
> >
> > Changes in v3:
> > - No changes
> >
> > Changes in v2:
> > - Improve commit messages
> > - Sysfs attributes moved to trackpoint.c
> > - Removed unnecessary comments
> > - Removed unnecessary debug messages
> > - Using strstarts() instead of strcmp()
> > - is_trackpoint_dt_capable() modified
> > - Removed _BIT suffix and used BIT() define
> > - Reverse the trackpoint_doubletap_status() logic to return error first
> > - Removed export functions as a result of the design change
> > - Changed trackpoint_dev->psmouse to parent_psmouse
> > - The path of trackpoint.h is not changed
> > ---
> >  drivers/input/mouse/trackpoint.c | 45 ++++++++++++++++++++++++++++++++
> >  drivers/input/mouse/trackpoint.h |  5 ++++
> >  2 files changed, 50 insertions(+)
> >
> > diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/tra=
ckpoint.c
> > index 5f6643b69a2c..e12d76350252 100644
> > --- a/drivers/input/mouse/trackpoint.c
> > +++ b/drivers/input/mouse/trackpoint.c
> > @@ -393,6 +393,45 @@ static int trackpoint_reconnect(struct psmouse *ps=
mouse)
> >       return 0;
> >  }
> >
> > +/* List of known incapable device PNP IDs */
> > +static const char * const dt_incompatible_devices[] =3D {
> > +     "LEN0304",
> > +     "LEN0306",
> > +     "LEN0317",
> > +     "LEN031A",
> > +     "LEN031B",
> > +     "LEN031C",
> > +     "LEN031D",
> > +};
> > +
> > +/*
> > + * Checks if it's a doubletap capable device.
> > + * The PNP ID format is "PNP: LEN030d PNP0f13".
> > + */
> > +static bool trackpoint_is_dt_capable(const char *pnp_id)
> > +{
> > +     size_t i;
> > +
> > +     if (!pnp_id)
> > +             return false;
> > +
> > +     /* Must start with "PNP: LEN03" */
> > +     if (!strstarts(pnp_id, "PNP: LEN03"))
>
> Missing include.
Sorry, I am a bit confused here:
strstarts() is already available through the existing
#include <linux/string.h> in thinkpad_acpi.c.

Do you think I should do anything else here?
>
> > +             return false;
> > +
> > +     /* Ensure enough length before comparing */
> > +     if (strlen(pnp_id) < 12)
> > +             return false;
> > +
> > +     /* Check deny-list */
> > +     for (i =3D 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
>
> Missing include for ARRAY_SIZE().
Acked.
Will add linux/array_size.h to the include list.
>
> > +             if (!strncmp(pnp_id + 5,
> > +                          dt_incompatible_devices[i], 7))
>
> Fits to one line.
Understood.
will come up with v8 soon.
>
> > +                     return false;
> > +     }
> > +     return true;
> > +}
> > +
> >  int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
> >  {
> >       struct ps2dev *ps2dev =3D &psmouse->ps2dev;
> > @@ -470,6 +509,12 @@ int trackpoint_detect(struct psmouse *psmouse, boo=
l set_properties)
> >                    psmouse->vendor, firmware_id,
> >                    (button_info & 0xf0) >> 4, button_info & 0x0f);
> >
> > +     if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
> > +             error =3D trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBL=
ETAP_ENABLE);
> > +             if (error)
> > +                     psmouse_warn(psmouse, "Failed to enable doubletap=
: %d\n", error);
> > +     }
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/tra=
ckpoint.h
> > index eb5412904fe0..3e03cdb39449 100644
> > --- a/drivers/input/mouse/trackpoint.h
> > +++ b/drivers/input/mouse/trackpoint.h
> > @@ -69,6 +69,8 @@
> >                                       /* (how hard it is to drag */
> >                                       /* with Z-axis pressed) */
> >
> > +#define TP_DOUBLETAP         0x58    /* TrackPoint doubletap register =
*/
> > +
> >  #define TP_MINDRAG           0x59    /* Minimum amount of force needed=
 */
> >                                       /* to trigger dragging */
> >
> > @@ -110,6 +112,9 @@
> >                                          external device will be forced=
 to 1 */
> >  #define TP_MASK_EXT_TAG                      0x04
> >
> > +/* Doubletap register values */
> > +#define TP_DOUBLETAP_ENABLE  0xFF    /* Enable value */
> > +#define TP_DOUBLETAP_DISABLE 0xFE    /* Disable value */
> >
> >  /* Power on Self Test Results */
> >  #define TP_POR_SUCCESS               0x3B
> >
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
