Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC734AB03;
	Thu,  9 Jul 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604720; cv=none; b=PvA8VS06LZm/0xQvXwvaXy7MQZemJ76TvJ0qpi9ASei/fYa9BbyZANnPW6m0tQgROi5IGra3S4Nj6ZVyT298A9sKXQOQJz/3lY0hMgRfWeAaOkMIvyANpUvXt1CSWw3HyC51DalwIicDDKC02wJnmW+sVJv0kP8lBi+fQ/hKQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604720; c=relaxed/simple;
	bh=6jsEnlxqpS9K7EvSox63384EYssUKnEuJH+8wLAGgdk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mkJuWG51XslJlVxSKcvnICwn0EMGyKaer9gdzAJVYh5r1GQl51BltUBNc539z8E2OrBGQXfKvs1wBRBMjv537FU1sbXCydOBoAg3OMwoTB8gmNHTufzOOrViW2RdMqfy1BhUoRjyq7uNhyUtBc8nuV/+AnfEO+kzE4Q2XONX5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9LJp1hL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9LJp1hL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604719; x=1815140719;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6jsEnlxqpS9K7EvSox63384EYssUKnEuJH+8wLAGgdk=;
  b=a9LJp1hL5K68m4Wn5mT6YMzVHEzw0U/b+jYnu9l2tS+u+HwmXwPNfrjR
   7tTmeCY7fv2YdIk6WPsjFb1yCexgcqOWzHH+A0Kq+3z3e3jh7x9gAlySo
   KmKekKGHipw49w+ntnZD0gHFV4OE51iT35b13bPbplUnzMH41hGPH1vXT
   Zf1UNgxCcatKG8Q3+lmkTM5mmQNc7DEDN/Au9IdKQHEXLhdUhYpOgHOsj
   +bNeNMKq/Hqchab5bd+j0zFj4eQLXSqX653dOw6L3oVHQKwrhOEhpw8Wc
   TS3miWAKHVNr0u15HdSwiCWXJ9ZpyfqbPfCX+4jNL28obc5dviCT8nSbf
   A==;
X-CSE-ConnectionGUID: ElKAyxpMSFyAkFk9YUC01g==
X-CSE-MsgGUID: JkInIl1QQN67ARvP8oacwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84066535"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84066535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:45:19 -0700
X-CSE-ConnectionGUID: cK0KB1mdQNmMzNegPNkQiw==
X-CSE-MsgGUID: LzXINQn/RtmLeaL7ZDKJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="284703421"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:45:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 16:45:12 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] platform/x86: uniwill-laptop: Add lightbar support
 for LAPQC71A/B
In-Reply-To: <508f969d-9ba4-48d0-8e2e-ec7249392db3@tuxedocomputers.com>
Message-ID: <528af158-819f-fe4f-d1ca-2617f2ad2471@linux.intel.com>
References: <20260530170813.10166-1-W_Armin@gmx.de> <20260530170813.10166-8-W_Armin@gmx.de> <df32200d-d966-40fd-b8d4-60c5b7e18822@tuxedocomputers.com> <d06fffe8-0cf6-3ee4-8ab6-c6a87ea4e7b9@linux.intel.com>
 <508f969d-9ba4-48d0-8e2e-ec7249392db3@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-165826051-1783604712=:1261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-165826051-1783604712=:1261
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Jul 2026, Werner Sembach wrote:
> Am 09.07.26 um 10:57 schrieb Ilpo J=C3=A4rvinen:
> > On Wed, 8 Jul 2026, Werner Sembach wrote:
> >=20
> > > Hi Ilpo,
> > >=20
> > > Am 30.05.26 um 19:08 schrieb Armin Wolf:
> > > > The LAPQC71A and LAPQC71B both feature a RGB lightbar with 36
> > > > brightness levels per color component. Extend the device descriptor
> > > > to supply the maximum brightness of the lightbar and whitelist
> > > > both models for UNIWILL_FEATURE_LIGHTBAR.
> > > >=20
> > > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > This patch lost its original attribution by accident (it originally c=
ame
> > > from
> > > this RFC from me
> > > https://lore.kernel.org/all/20260421201103.142403-3-wse@tuxedocompute=
rs.com/)
> > >=20
> > > Since the patch currently is only in for-next can this still be fixed=
?
> > >=20
> > > Obligatory:
> > >=20
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > Hi Werner,
> >=20
> > Your Signed-off-by has now been added into the commit.
>
> can you also fix the author?

Also the author field is now changed in the review-ilpo-next branch (it=20
will eventually propagate from there to for-next).

--=20
 i.

--8323328-165826051-1783604712=:1261--
