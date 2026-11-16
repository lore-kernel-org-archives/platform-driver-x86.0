Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794825756;
	b=VynB3KA/U1Yr5zApSf3anYHCdDm6K9ALROa3SV0bRhQSYmPBZFA6v3UNtt0WRJ7ey6xn
	 9qBYGRgW+2eDfORe99U47K4hq5BVIGEAhSJLwb5JUM9zJudSLyO4axfcyreq+ApHlGRmn
	 t30FgyMPAq7jC2r+iqA2br3/H0Nkt8ReHNsnro1VL7Z/Mt5fRP+A5leCs1kesdgty8+Ja
	 pirLQcBvrL0KgGzVpWkmvKPFviOkk058vYOWiCco14oOc9r9buOpCrXYLSM1KlRbMGVNr
	 SOPtuRYNeLJLLuRS29gqB8CviD3zO5zR61jaFvTJu5E0zHHPyvIztRaw3DWopZh0Rxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=m3MGBQhgIKYyixzY09J7TewxQkz7EbHSbLecvC59LfI=;
	b=10mI3j2NXQLX+i0LtVR0yniVVVVS/QBXLsH9NRc+x4KX4ErxyAb7HDXGBk3bundpD1J3
	 A2J0ADk/UWB9/sch1ge43sdqbdEMPY+1ijx964zecmGmiZDRiOgIVQwgcqhjKAibAHNMk
	 Lz0oa9gFRlcStOqBQsnhttvs9Xm1umY8OxDwdBhchbfLXH6eRNzEQg9Y9hMsvCyt+SzRy
	 17h5jgbsY4ETd1cM3h2oA6NJ3SwXbsoGBHXI0yaPMIbmnq2BlDXxlHpSJ+6CB0OQYG3ro
	 fiqPZj1iy6GTJNd0zKhKBVO55hDKF5K4XAIMvHfcAZsRuLDQcqRvokwVzhycZWoU9aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORtqLYbk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3605C606A323
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 10:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3605C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORtqLYbk
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab46699a09so32162791fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 02:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794825754; cv=none;
        d=google.com; s=arc-20260327;
        b=jusnu6D1C1E64naCNzcXwgg+nJW24Torlt1LMRMUzCJk4udCTCo441RvwRexQhRGVw
         AIxaRx6XV5INzTDzcnIWnqBvdQgkieQYXgsQJyiiMX49LdAlg6NRJUHy5BOi09R/7DOV
         sDwoVtlEzUDGo8SsgaWwfeCP8Z81gIfs2N+iLlvunmI/VEb6ebVH0FcX6+CdP1tnvQcF
         NWW99I1zSk8+fvC/6rfJCIj/j60agd/UIVKY+USw2qQ2jYbhHDM0eF0FcpPEe7R7GL8H
         oOZ23Jp2W5Q/nRcq9lIv5dZG0DLiwVrrLHcfoEWaoNN4LGeSfALw1uhg4zgvULlmqjMC
         YOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3MGBQhgIKYyixzY09J7TewxQkz7EbHSbLecvC59LfI=;
        fh=yOPfgWpuewOhf5/RYJLkx8qEL9X3OGUBBDK1q2vjPic=;
        b=L6JXpqzCEivYfPoz9zYde5EAdXBb/0VzRe87507mf7ui1NYowzUmCiImKFnDsTrX1N
         041kM1mzzwfeMGzcj7iy7xKS+zq776VX6PMDrcQ+yJk1TRrGRZqyGyBKrV8oUNegvo4B
         V4swVic7MWXMRyiJLIzBdtIEhrdEQPg//ZFMbn8lp5S7bv0IPIwSxoTwNZKtZp0naEHQ
         P8unhWjK/2N2XVj49xq45PRB6GELPNUMbBU63S7gj3HHHL3/5VtZ0AJJwR0+z46Ur5p/
         CaFgs2xI7ZltmNc/flAUo3W1xNDayuusaYY/cE4ITLut6VikQVtqKHhQFxd02uFTNFhP
         r9ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794825754; x=1795430554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3MGBQhgIKYyixzY09J7TewxQkz7EbHSbLecvC59LfI=;
        b=ORtqLYbkYNdu1Z0racQhA9SLkzrIc4CyXH8CiFeiU2B4MrVOBiFGpDf8YNnklUpRFT
         aZpHv8izdPm6ukf1ZL0PYVsCSn2YWODE+6vKe48xIZA3om5/MAF/7DpRb6qQx69CWsR2
         IyNyDQ1RXIKfDSMU2P24RTe3YPTNGR/1Nqsww7awjZE5oPuXMxajPJktY3Y82qIt0sUW
         7qTqQiJS88NF/8uPviiHNn+nrxz5Jx3GcRZ04tPplMXntX5/6ujSTnOPIBPNhWNTlQQi
         9ZCDV6yA5dV3MfV8oc4ogo6FzkHqiQnsLHrCbxTI9LpXhBriBENBth+jrk5O/EOdpOnP
         pdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825754; x=1795430554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3MGBQhgIKYyixzY09J7TewxQkz7EbHSbLecvC59LfI=;
        b=PTZyrOU+pXb8xqAiGVw6CLlnvNPm6S1VndaoQvHO4I6YwMZjDn9ROB3A15e+ShgmVr
         bQlqKADw6YmLd50oSQoks7bpM6OLvM8VylUptFky4Qp496GTcDKoQawO4j6Q4m3RgxQi
         F3jdXu5hh0it8+FrOk5ZnBzRk6hs5Xp4vTHvasXUnWmlijpYWqeZ4wXBGIzqtLV6f/gM
         TglrvuID+5DU73RIjgvCYoM5QhQ76XZNc6bz/2KA7HnbaKLSpE7Tkr/ANCvIm5djgjqq
         FPJHk16pojNZFcIUp+NOAXHQeGM2GxtDfzlkcZ1h/UWYb8jbW+Jkr9LrXcTN7agIRFyY
         7MjA==
X-Gm-Message-State: APuU4Z/2gr0yEhyQ/iQ8W1r6OCIvePmHU0KvrVXI41igMzP1x8zro7jx
	UAyoFgxmXTCmxBeDQg63x7JEo8w4Y2t4DgB4zsQKqnxH+yPHBhz8oQPdu7w6gZ1CHRLogx1oJ6f
	OecI9/DDSoIa4IvZCmJlWqJ5RXr95EqoJGQ==
X-Gm-Gg: AYBFou29ZTPnmMcZyUrQIBRfjCiXGX/WazMStU9t3yby4Aq4bQh7ChhVW6Ju8dGI8vG
	kZ7BxQBXA/Hmn9dXAyQ7lO+c1V6jf/+XkYPDq5JfXgpEfmnukE3xsC+jyqIKC33FeDa5CK0pXtN
	NKZoidcwcsAW8h5w/w1ykfVys4pKJHb51Wpjs1Sii4cNAoolfUW6WAyrqflyeETOuDY32vSUjsl
	QP1XA61TbVL21DWfUql+QB8y4z9KIrSRDa0LU9ukTP+RzIk3EJBfHbg/HlSh4kjvKcDPHk6aiS6
	CNKm86ZxEJRb3oHf61PcwOgfy7dHwQSgSoUUzrsWjxsglEn9YEbLZF5l1YP8gvn2Zf0TxOuK++H
	+TQG4bbayukwf726BiEnDuu7JUourbcKsSnSib/ltz8hcIUo57JlIdyBvTlhlKUaGP6tCxq0QfD
	qS2eBV8C1KM4DV/Tz2NqdHV+zE03JhdJpbn1xeltSkBn3cIBtThgd5FiTRiyBaFhry3smHtBQ6B
	5+L+xgf70vbtIy/VQivktEgULDGjKI6BWm905hVsIwRrH5/f903T/rhIwFpInjpX1LHxJ1Si1kA
	tJKTbkjvA7U3XbHjd8eVSg7NuFMm3T5YB6Cd7LnpRt/M1d96MATh9280+3LZjwkhY39juynKAya
	IuoRzifPf2XV22Hq2
X-Received: by 2002:a2e:be9a:0:b0:3ac:e31b:bb74 with SMTP id
 38308e7fff4ca-3ae2b3830acmr30158161fa.0.1794825753996; Mon, 16 Nov 2026
 02:42:33 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CANsc=4Uec03px3_Q+4YQDwL9H5FugS_QyEGPKAOy0Nq5tTOmPg@mail.gmail.com>
In-Reply-To: <CANsc=4Uec03px3_Q+4YQDwL9H5FugS_QyEGPKAOy0Nq5tTOmPg@mail.gmail.com>
From: =?UTF-8?Q?Adrien_Verg=C3=A9?= <adrienverge@gmail.com>
Date: Mon, 16 Nov 2026 11:42:22 +0100
X-Gm-Features: AclHuK88R5zAsdzU95wW_YEjuFwAVqEW10qO-ZILEdbyk1QGdl9liyTAYXjkwuo
Message-ID: <CANsc=4VmFuOxeWhetC0v6JM8xruMMadFMOTT0=ORAEY_3tFJqg@mail.gmail.com>
Subject: Re: [BUG] platform/x86: lg-laptop: Windows key not working since
 native ACPI events
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?H=C3=A9lian_CAUMEIL?= <helian.caumeil@clever.cloud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

After posting on this mailing list, I found this similar problem for LG lap=
tops:
https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

The root cause is probably the same, because I tested the patch proposed at
https://bugzilla.kernel.org/show_bug.cgi?id=3D222161#c14 and it fixes the b=
ug
introduced by commit ad873d634095 ("platform/x86: lg-laptop: Add support fo=
r
native ACPI events").

Thanks for this fix! I hope it can be merged upstream and backported to 7.3=
.

Adrien



Adrien

Le lun. 16 nov. 2026 =C3=A0 10:34, Adrien Verg=C3=A9 <adrienverge@gmail.com=
> a =C3=A9crit :
>
> Hello,
>
> It looks like commit ad873d634095 ("platform/x86: lg-laptop: Add support =
for
> native ACPI events") broke the Windows key (meta / super key) on multiple=
 LG
> Gram laptops:
> - Pressing the Windows key doesn't trigger any action, e.g. showing all
>   activities under Gnome shell or opening the Application Launcher under =
KDE.
> - Randomly, pressing the Windows key multiple times in a row (between 5 t=
o 20
>   times) does trigger the associated action.
> - Pressing the Windows key in a combination (e.g. Windows + L) does work.
> - Soft-swapping this key with another (e.g. =C2=AB Alt swapped with Win =
=C2=BB in Gnome
>   Tweaks) allows bypassing the problem (e.g. pressing Alt key shows all
>   activities, like the Win key should).
> - All other keys seem to work fine.
>
> Impacted hardware at least include LG Gram 15 and 17 (see
> https://github.com/CachyOS/distribution/issues/619):
> - LG Gram 15Z95U
> - LG Gram 17Z90TL
>
> I bisected the bug to commit ad873d634095 ("platform/x86: lg-laptop: Add =
support
> for native ACPI events"), which appeared between Linux 7.2 and 7.3.
> Additionally, reverting this commit on the 7.3 branch (along with commits
>  543efc52befa and 9f5724492217 that depend on it) fixes the problem.
>
> My knowledge in ACPI is very limited, and reading the commit, I don't kno=
w what
> should be fixed. However, I'd be happy to help and test patches if needed=
.
>
> Thank you for your consideration!
>
> Adrien Verg=C3=A9
