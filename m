Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CCE283FFC
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 06:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758005169; cv=pass; b=upNGMwXMdnFU1t3OUUcWTga0vd92+xXjzmpKsb+a95HfS9GwRcRIDxWvOdFQaNBIfPjTzq/7lOe4SYn9IBTHcVsFoeLzxhjXw1pj5K5XlTZT4eOe+2zNUHs2n/1Z8kWN5X6pQWMTYz5KJQqhHcKb8edOT3XhaHb4QiIfla8iDA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758005169; c=relaxed/simple;
	bh=ZCwfuOlLo9WxKI4qqTxN4Z4DmR0WsXAbkXTY+/5GmYc=;
	h=From:Content-Type:Date:Cc:To:MIME-Version:Message-ID:Subject; b=HPp7ensPdQbZkKKBbYHCcnU69sRNReuAIZw4A6HGDCBs7Tl7PaQ7BHdSH+qoiU4wmZWh2hWe1ry2CFya53AshRPO0wKWsYPdVT30zs/iEYoinly4hqPxkIfUeBm3H9g9BLpTvDeCYn32N4izaOOB5fKBfYoDs51y5POsG/12k+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=INLRJHx6; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=wXxssdn8; arc=pass smtp.client-ip=136.143.188.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="INLRJHx6";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="wXxssdn8"
ARC-Seal: i=1; a=rsa-sha256; t=1758005138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IQCn+bGFlkzwkIgMuTQBxJeJgcbicFbQ7dumJrBm2JBqMC3G3naXsVk/3IvHMlUiQLrXsKon83bldmVlo5UKUboEUzvObgH2kCKUd9Nfx8L3nyvxARBDcXtir6ze+iDYiaGdjgKo0XqawpIm+tixAK9gZeT0pa6Kgz4B+g4jIEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758005138; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lGNVn2X6XiExm9XEFVFrBFWPBDKWO22K15/dLZLdyjY=; 
	b=ejXNeWzXMXY5hj/rRLotcsYwtMO3w+9dABpaYP6BNdVrpV+oXl9QYjL42F0oZUqLKtYvO09eg2HZ5MCB15Pddk/CmDqXPwGb5sIMX1b1h9sE3VuWCJkgLNwhMtP0CoOvOiEoTsTZGAnqjf7v+4xnnVyvbusLjqO5dpUBuLRKYIw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758005138;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:Content-Type:Date:Date:Cc:Cc:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lGNVn2X6XiExm9XEFVFrBFWPBDKWO22K15/dLZLdyjY=;
	b=INLRJHx6tHOY23GWK5kY0kwm/z5sKZaW1+FHSiXzXcrMlELLeBoOcwUFNE/scbtN
	qfXrPgLA5ogx2yZrqSIJv7AnI87qZCttFWS0zNIs33EiIMVfdmMA2HamjdgflDKdPw/
	3/CRRPeKpbVvGUzTKMB62z3XTVy48uxSDx88bpZ4=
Received: by mx.zohomail.com with SMTPS id 175800513662540.037963983991744;
	Mon, 15 Sep 2025 23:45:36 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id DF9ABEB8AA;
	Tue, 16 Sep 2025 06:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758005135;
	bh=ZCwfuOlLo9WxKI4qqTxN4Z4DmR0WsXAbkXTY+/5GmYc=;
	h=From:Date:Cc:To:Subject:From;
	b=wXxssdn8tKaqJuV0Zrt+soxHkfNLw+L896LYd44v5M1FuritZsCHR6aZCobm/+89c
	 Bp6GA3TgehSPu2nD54Wb+b/jy2SIF4IMOtuqgITMu71icXAtMjhOhlrqaJTMVtfU1D
	 rhu1du6sFY78Mym20lvYRDSrG4gRUOmNwu3AjA+3FP6N4mCOqPl7bHmgwTIy44hMrJ
	 dnyAD4gL96Jz4l++NCiP7GdLdnRzkbrnhoWzS8RibABLm3eS2Y9ztFonRORXBQesHt
	 jhJ/u9l13zl7gfTtsYCvThGKn++PkMrs26AYRK76Pqzj0V5xUgnqy9LwMZpLCdJKRd
	 4ah0gLTIcNiNg==
From: "Rahul Chandra" <rahul@chandra.net>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
Date: Tue, 16 Sep 2025 02:45:34 -0400
Cc: ilpo.jarvinen@linux.intel.com, lkml@antheas.dev, mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
To: platform-driver-x86@vger.kernel.org
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1e1-68c90780-93-13ea166@216760021>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Added some cc's=20

*Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is the s=
ame on the MA)

--=20
Rahul
On Tuesday, September 16, 2025 02:36 EDT, "Rahul Chandra" <rahul@chandr=
a.net> wrote:

> On Monday, August 25, 2025 07:30 EDT, Ilpo J=C3=A4rvinen <ilpo.jarvin=
en@linux.intel.com> wrote:
>=20
> > On Fri, 08 Aug 2025 17:47:09 +0200, Antheas Kapenekakis wrote:
> >=20
> > > Currently, the ignore=5Fkey=5Fwlan quirk applies to keycodes 0x5D=
, 0x5E, and
> > > 0x5F. However, the relevant code for the Asus Zenbook Duo is only=
 0x5F.
> > > Since this code is emitted by other Asus devices, such as from th=
e Z13
> > > for its ROG button, remove the extra codes before expanding the q=
uirk.
> > >=20
> > > For the Duo devices, which are the only ones that use this quirk,=
 there
> > > should be no effect.
> > >=20
> > > [...]
> >=20
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-fixes branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-fixes branch only once I've pushed=
 my
> > local branch there, which might take a while.
> >=20
> > The list of commits applied:
> > [1/2] platform/x86: asus-wmi: Remove extra keys from ignore=5Fkey=5F=
wlan quirk
> >       commit: cf3940ac737d05c85395f343fe33a3cfcadb47db
> > [2/2] platform/x86: asus-wmi: Fix ROG button mapping, tablet mode o=
n ASUS ROG Z13
>=20
>=20
> Hi, with these commits on the branch the "Airplane Mode on detach/att=
ach" bug comes back (The bug the quirk was intended to fix) . I think t=
he Duo emits 0x5D (toggle, because it deactivates and activates on atta=
ch/detach) however I have not confirmed this. This is a regression from=
 the previous patch and I propose that we either revert the commit or f=
ix the keycode. I am not submitting a patch because I don't know if 5D =
is used for a different purpose on the ROG devices, can someone confirm=
?
>=20
> --=20
> Rahul
>=20
>

