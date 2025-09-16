Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com [136.143.188.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D00C2165E2
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 06:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758004594; cv=pass; b=Yp/bvZNYomoVkpHoYyKul1/56sqjyJcZRP6SZaV1os4DicH5vs0e5sAC8npg41zzBD6Kop43nhPU2Iy94xPOtSfP+G0hYEyTx/6slkgwz8snCXkusVKF8V6AHEuN/qItY3CbJIxXL90xhAkv9gpUGmQSEqT1puhp9nd5/1I9kX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758004594; c=relaxed/simple;
	bh=6OSBUWRmuf2iSg9SJzwMdOktDm+3oMNAX8PKCQ67JGs=;
	h=From:In-Reply-To:Content-Type:References:Date:To:MIME-Version:
	 Message-ID:Subject; b=p7oKLu7vFFZa48WjLYF4W5AiNulVoJB2gy3WRklOK/1J/INOrnPJJFPCuD3Cnwr9x6Dq9q7SH6TOBguDA+1tAfauhwQ298eAvXt8ZkyHa7T581sXfUy2veuoL6KoygaraHbmgq+ii8ZfHXIAUNo0vO9KsKc5MLq5zmw1Qj37ZmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net; spf=pass smtp.mailfrom=chandra.net; dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b=BBiLpcJS; dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b=q/s3qJQj; arc=pass smtp.client-ip=136.143.188.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chandra.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chandra.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chandra.net header.i=rahul@chandra.net header.b="BBiLpcJS";
	dkim=pass (2048-bit key) header.d=chandra.net header.i=@chandra.net header.b="q/s3qJQj"
ARC-Seal: i=1; a=rsa-sha256; t=1758004590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hAE2RpmynQspZ2ni8ISgFgiBVhEllYzXxWEH5LAp/6EgLmUufQKSK2Fjx3QqbqMfH3vZJLsRU9pu+LCREs4Sh3uEVliTnCSfTVh860XU49MQNa1m7XBhzJtFqYMqWE2tZasLEgDPiDE2Qgjw5hGqGkGf6Pom+CdDqBst0JLNc8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758004590; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=8T/MvIUc9bf07ouceglm2KVs+XRMUIwtgDdb5m59lXA=; 
	b=NbN2mko+/cGyPyJXBa/WszSz7Y/czua7swQX/Rx3/iNtnvBROQXNQZ5t+F2eADj7C+WVNz14w5k3gJhPACj2USPH3vRaOc3s4xvT6ngWlawzygNqWa8UWy/0HY2G7lAJhesbmm7z7y/bbS+HqSc2dSv28ifFKOTSDP0EE0Pm/o8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=chandra.net;
	spf=pass  smtp.mailfrom=rahul@chandra.net;
	dmarc=pass header.from=<rahul@chandra.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758004590;
	s=zmail; d=chandra.net; i=rahul@chandra.net;
	h=From:From:In-Reply-To:Content-Type:References:Date:Date:To:To:MIME-Version:Message-ID:Subject:Subject:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=8T/MvIUc9bf07ouceglm2KVs+XRMUIwtgDdb5m59lXA=;
	b=BBiLpcJSloVNcJ52Eij7CpSqU0Ds34cP0SEZcBmVpS57ST5f2YXsN6uLoBr2LRdZ
	bEKKq/tTLhXxmyPdU4Q3z8tT0lAlSSGCa2qVJgUd/qwxJ9YAu7CRRJfXI64EeMWiu3B
	TNLr0fLpcPPZpLPRWmQ0b0fiEi+3MHOoToqh8/TA=
Received: by mx.zohomail.com with SMTPS id 1758004588162688.7778525675631;
	Mon, 15 Sep 2025 23:36:28 -0700 (PDT)
Received: from sogo.mynetworksettings.com (pool-173-70-162-2.nwrknj.fios.verizon.net [173.70.162.2])
	by mailserver.projecteclipse.org (Postfix) with ESMTPSA id B88ABED0A4
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 06:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=chandra.net;
	s=default; t=1758004586;
	bh=6OSBUWRmuf2iSg9SJzwMdOktDm+3oMNAX8PKCQ67JGs=;
	h=From:In-Reply-To:References:Date:To:Subject:From;
	b=q/s3qJQjL12thMcQQ7nLpN1J6NR3oX5tyzttNIwoBQ1lG0qcgYpm+eo+De9ZS36mk
	 1cGyKZGb84sCWDhUkzoE+OlYYZpQ/VJny72FSpF/wI62dSdMDLkYfFaqkc+xrL8R6b
	 JgRlx6FSWkbtl2RqTI16jcG3VyFo/t+P8ZZlt6pJPHk7Aly8XVClfqDRPqOMsHvvnu
	 mAqWjxTAmZQs3KA6KbPanJzHlvwCdON/k1eKdwCX9Q/SOEYa6QqOI09ILmVv7I9SnD
	 OjS9DnO1wXFQ/OOAZqiQKm4x8+tyvusk3gJZBHPfHxL+eXlHtP6iFUPKEN9EmSU/0X
	 CaR9yaGt3LT0w==
From: "Rahul Chandra" <rahul@chandra.net>
In-Reply-To: <175612143487.7176.12842954767446670180.b4-ty@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 173.70.162.2, 192.168.1.147
References: <20250808154710.8981-1-lkml@antheas.dev> <175612143487.7176.12842954767446670180.b4-ty@linux.intel.com>
Date: Tue, 16 Sep 2025 02:36:26 -0400
To: platform-driver-x86@vger.kernel.org
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1df-68c90580-11-25b5f500@10457317>
Subject: =?utf-8?q?Re=3A?= [PATCH v2 1/2] =?utf-8?q?platform/x86=3A?=
 =?utf-8?q?_asus-wmi=3A?= Remove extra keys from 
 =?utf-8?q?ignore=5Fkey=5Fwlan?= quirk
User-Agent: SOGoMail 5.12.1
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Monday, August 25, 2025 07:30 EDT, Ilpo J=C3=A4rvinen <ilpo.jarvinen=
@linux.intel.com> wrote:

> On Fri, 08 Aug 2025 17:47:09 +0200, Antheas Kapenekakis wrote:
>=20
> > Currently, the ignore=5Fkey=5Fwlan quirk applies to keycodes 0x5D, =
0x5E, and
> > 0x5F. However, the relevant code for the Asus Zenbook Duo is only 0=
x5F.
> > Since this code is emitted by other Asus devices, such as from the =
Z13
> > for its ROG button, remove the extra codes before expanding the qui=
rk.
> >=20
> > For the Duo devices, which are the only ones that use this quirk, t=
here
> > should be no effect.
> >=20
> > [...]
>=20
>=20
> Thank you for your contribution, it has been applied to my local
> review-ilpo-fixes branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-fixes branch only once I've pushed m=
y
> local branch there, which might take a while.
>=20
> The list of commits applied:
> [1/2] platform/x86: asus-wmi: Remove extra keys from ignore=5Fkey=5Fw=
lan quirk
>       commit: cf3940ac737d05c85395f343fe33a3cfcadb47db
> [2/2] platform/x86: asus-wmi: Fix ROG button mapping, tablet mode on =
ASUS ROG Z13


Hi, with these commits on the branch the "Airplane Mode on detach/attac=
h" bug comes back (The bug the quirk was intended to fix) . I think the=
 Duo emits 0x5D (toggle, because it deactivates and activates on attach=
/detach) however I have not confirmed this. This is a regression from t=
he previous patch and I propose that we either revert the commit or fix=
 the keycode. I am not submitting a patch because I don't know if 5D is=
 used for a different purpose on the ROG devices, can someone confirm?

--=20
Rahul

