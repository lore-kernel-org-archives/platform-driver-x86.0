Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEEE44F56D;
	Sat, 10 Oct 2026 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791631436; cv=pass; b=NWOhWTMHGbwSG/qe0sIYWY8ujT0EnSJJBD5FP1Gxh07ARmbJYwFIBZCpYPm8T2BLrW4ptKriNtiSLcQ3igfo/rn5sLCllqQxmjo9muBBr68ztb9UmJ8KwgdBwNPanbdKXU9pOqkJh6SZGbc2gxVGsK+KBdkN/ERx1VbRFFI13yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791631436; c=relaxed/simple;
	bh=pJSOzAxuESSCHlMg0Yz+jQnIULz9WJc15TtLgcWELyM=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R7mlMBJzBvSZ5awy6eE/Ug0/sBykJQ9q6RwjbWWpSlEzxEcdETt/Yv8c2R9k0QJMrYMe+ZGNzwnaDF8UJ4VnPCUc7kuQgAFBCWZyIkpN/j+k/iv5Aktz2Amv7Cl28MVotGZQSQbp+bUGxR7he5dlDLCPhs9pYP5j/PzzSQf0oI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Zp4dtU/I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Zp4dtU/I"
ARC-Seal: i=1; a=rsa-sha256; t=1791631425; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FFhLq9qX0AU02BgR+sa+07l2K0P0WkAxhpAKHsbJBtmCVcu+J4u89Ve3M4/1JiByjvSQrXUYiem6UoksA7qubW4a5iamkK/yR0YRe3BQjQ6HscWn/vrwORU0vT6yA0LAS2ybi+eHCTV1R8/FO/amdQ/UMVygZbMIAkXW/rmRogI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791631425; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dPQChoPlEadkoNfJGLN5purAAZBFCFsFppLh//R3MAg=; 
	b=ByOZoOjiXe06LL5oGCaDkAK+xVYJ27lyYM2I8BBPx+/sYatshjswfvApkn4TXkujhPKPL1B7Di09jKsY9ZcQXAhFWbY7OAoIp5Ypud7MbxvJTteEbPkMB3m6OV2RhU0JVOyz5awoZdDQkWQ6tdI8XrxLYmikOh9dWmOmajrE/Oc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791631425;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=dPQChoPlEadkoNfJGLN5purAAZBFCFsFppLh//R3MAg=;
	b=Zp4dtU/INmgT3rM+g7iWUO9WM0wGjIp5pY56OIjg+CB7Jgfe13gcGZg7xJQRJH5v
	m46QVFlCaj5DzFcr8ZIpdavZRbrGNSEgfYI5UZcCZL5tj6s/XoFyQrjuKXLDtUUZdzi
	C7tDpjJjyXeglqgwpdVDT/AtypwmT2BCdfnn4NEMtGRKnbP5YgV9AOh64ADttEmBiw3
	hqKP0CastmvGNWAbReYpNOkty3ohUZn6/lHSMcE1tGEY0vehrGeuPTWdIGxuqC/ZMPI
	wLNg3gkozXLedk0lBPSJUUsY4L/Hda6FkdhGdZ8z4bfnPBXf4x6LSkbe2qYNGypbZ05
	iRPsaPmQBg==
Received: by smtp.zohomail.com with SMTPS id 1791631424467426.4797389495177;
	Sat, 10 Oct 2026 04:23:44 -0700 (PDT)
Message-ID: <48662921e0679d4d7dc81f65f4496d4db7dcd084.camel@rong.moe>
Subject: Re: [PATCH v2 0/5] platform/x86: uniwill-laptop: Lightbar fixes
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, hansg@kernel.org
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <3a55c989-f16e-40a5-bd2c-201d45c82c85@gmx.de>
References: <20261007144101.323289-1-W_Armin@gmx.de>
	 <179148110928.29028.17146158167227573018.b4-ty@b4>
	 <3a55c989-f16e-40a5-bd2c-201d45c82c85@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 19:18:35 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Armin, Ilpo,

On Sat, 2026-10-10 at 03:22 +0200, Armin Wolf wrote:
> Am 08.10.26 um 19:38 schrieb Ilpo J=C3=A4rvinen:
>=20
> > On Wed, 07 Oct 2026 16:38:53 +0200, Armin Wolf wrote:
> >=20
> > > This patch series mainly deals with various issues inside the code
> > > responsible for controlling the lightbar on supported devices.
> > >=20
> > > The first patch utilizes the improved multicolor LED API to report
> > > the correct brightness of the lightbar to userspace. The next two
> > > patches fix issues discovered inside the code for controlling
> > > animations, while the fourth patch fixes an issue with the naming
> > > of the LEDs in general. The last patch also adds support for another
> > > variant of the Intel NUC x15 laptop kit.
> > >=20
> > > [...]
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
>=20
> Thank you :)
>=20
> I noticed that the LED next branch contains a commit that requires trigge=
rs
> to implement a new callback and prints a warning if this is not the case.

Whoops, I didn't realize there was another private trigger being added
during the same cycle.

I have some additional review comments on the implementation of the
private trigger. See my reply to the relevant patch.

>=20
> Should i wait till the next cycle to send a patch implementing said callb=
ack
> or do you want to rebase for-next onto LED next?

I would like to ask a similar question, too. The leds part of my series
has been applied[1], leaving the pdx86 part waiting for further review or
apply.

Ilpo, may I ask about your preference here? Would you prefer to merge LED
next and apply the pdx86 part[2] of my series this cycle, or prefer to
wait until the next cycle? If the latter is preferred, should I resubmit
the series then?

[1]: https://lore.kernel.org/all/179025272986.499136.14712876777665893306.b=
4-ty@b4/
[2]: https://lore.kernel.org/all/20260921-leds-trigger-hw-changed-v7-11-fe3=
cdb6dec51@rong.moe/

Thanks,
Rong

>=20
> Thanks,
> Armin Wolf
>=20
> > FYI [if applicable to your patch], as per Linus' policy change, also
> > fixes are mostly routed through for-next unless the fix is for a
> > commit introduced in the most recent cycle or is clearly a regression
> > fix.
> >=20
> > The list of commits applied:
> > [1/5] platform/x86: uniwill-laptop: Report correct lightbar brightness
> >        commit: de41d8b4d0dbb81c81cd99c245238d878a3e1951
> > [2/5] platform/x86: uniwill-laptop: Implement rainbow animation as trig=
ger
> >        commit: 59e4e406b6c08ad41f3ad86db6d42b82d8539c12
> > [3/5] platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
> >        commit: 969a3bfa474e35828e142d0160f393a97d9bf0ee
> > [4/5] platform/x86: uniwill-laptop: Label multicolor LEDs correctly
> >        commit: 42e6b269fc1134a3fcce57539034ee496e2c1344
> > [5/5] platform/x86: uniwill-laptop: Extend support for the Intel NUC x1=
5
> >        commit: 7a159a14ce0f5d5a3c2f835f39986ec5539ae374
> >=20
> > --
> >   i.
> >=20
> >=20
