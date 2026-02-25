Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB542EAD1B;
	Wed, 25 Feb 2026 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042859; cv=pass; b=eTzA3KlA4ijVf076zRIDZQiSw+Uvf6QiEK3gscyy+okx+fWsnaG7J1nGhO8+TPi2Cc9Cr3FqX5CBC2K4BU2Xc4d7iExPPPcYyQHK6ma1dI6vAkmkhP2pdfioLsDEHE5fb/QpNiadPoKKqTdqes8q+d+/J/sg5ssr/IhQIuOYy+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042859; c=relaxed/simple;
	bh=SQ8ACksFR1xDz9gdvssjFOdzX1VWM+scZUIGsvD5Sxk=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ih4BYzbuYYoblFJ+AklUn6oVjIUG1aF4etcdNmQuacHBy83L7irVl62g338B9MfUoHEhkxQkfKxyOUvPfztGrGcUIUBCH4rSRDzrJssVodpcHxagci5p2oWjw1/AFJXVPigYQxGPG9OkI5/8n1jjTY/Z2k+votf7fEqs8jpXcG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=gYlaBuI5; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="gYlaBuI5"
ARC-Seal: i=1; a=rsa-sha256; t=1772042849; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FuH0CX4/eUuvfGjbY1q7y2VsT6DZjE/L+X5rOrshSOjZKIjNx11AmgJzE1w6iG2pVhHq4yb4zbadJz518/+qkKNaWz2FfS0FkARwhC4v8yDJf9AKs2bBIcnDgL9IEVVZxBf0AADhFLXvZ8eYLaDxl6pg/ZJ3sRVd5S5V/Bempxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772042849; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1EUIj6GYDW42yTbF8LRdqcGBTwai9WytOWLOX4gCY5U=; 
	b=Lua7jt1nVhOPX1VxE0M2aytA5YgGH3DAp1V1smr3XIvYeRY9Hu1q7YZb2GuJlkuSH5EjEEL6A7BKd+Ly6VPvH7GxepPufUsSUql/xFqvvV/XQmA7sBqHyT85qfOkmwDPkwhRYxp1vXxUbUan/hA25Gg0E24C+efOFcpQecwqC1Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772042849;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=1EUIj6GYDW42yTbF8LRdqcGBTwai9WytOWLOX4gCY5U=;
	b=gYlaBuI5ZvLEyHgXJa5R+lK0GrPA5DRUx6WcyL04hXG/gOkCd2lQdl/oVDWyV+pI
	cAseK681CEB1s65q8Hp6M5oLzT/W90g/6k2/mVpTlhRdCR4/6L4O9JJS8B1ITd8repg
	DBz3Jb98isjJKjUJSe48/b29nKTPWFPAaCTgSM2S043jbGhhKJvZrhKCzhzVW9y3jiT
	aZI+fLhUnM4a9jRF4Q5ovsoFYJUeAgQ9t/97/f6gu0lTdmK1aw5f8RUAmrMFKngjI2Q
	A2T8MGolOuZHuyso9891BTPRn8jdHVyVzrUsn5RMBPdXHgm0244uvJBORaMByQ9Pc0N
	j5rzL7KxkQ==
Received: by mx.zohomail.com with SMTPS id 1772042846692457.68345647938884;
	Wed, 25 Feb 2026 10:07:26 -0800 (PST)
Message-ID: <d9543212244feba3f0dd5cab70e600c878540e7b.camel@rong.moe>
Subject: Re: [PATCH v3 0/6] platform-x86: lenovo-wmi: Add fixes and
 enhancement
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2026 02:02:21 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

Sorry for the late reply. I was busier (yet happier ;-)) than I had
expected during the Spring Festival/Chinese New Year.

On Tue, 2026-02-24 at 04:31 +0000, Derek J. Clark wrote:
> This series adds many much needed features and fixes to the lenovo-wmi
> drivers.
>=20
> Patch 1 adds a macro to make assigning attribute ID's for capdata
> cleaner and easier.
> Patch 2 addresses bugs where devices that don't support exposed
> attributes would still create the attribute, and also attempts to
> identify the correct capdata and set/get methods as some legacy
> interfaces don't use the custom mode in the method or capdata ID.
> Patch 3 adds the remaining CPU attributes that weren't previously
> exposed.
> Patch 4 adds the GPU attributes that weren't previously exposed.
> Patch 5 consolidates name constants in preparation for patch 6.
> Patch 6 adds battery charge-type limiting when supported only by WMI.
>=20
> After applying Rong's series from
> https://lore.kernel.org/platform-driver-x86/20260210191938.137234-1-i@ron=
g.moe/
> I found that there weren't any conflicts, so rather than combine
> the series we can just review each separately.
>=20
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

The patch series makes sense to me in general except for some issues
mentioned in my previous replies.

With style issues fixed, you can add

Reviewed-By: Rong Zhang <i@rong.moe>

to patch 1,3,4,5.

Thanks,
Rong

> ---
> v3:
>   - Re-add HWMON name const and jsut rename LWMI_OM_FW_ATTR_BASE_PATH
>   - Fix linker warnings by moving acpi/battery include to the end of the
>     list.
>   - Remove CPU/GPU OC features. These attributes are BOOL type and will
>     need a new constructor that I'll add later.
> v2:
>   - Fix gpu_mode misisng from attributes list.
>   - Fix prototypes for power suppy patch.
>   - Reorganize CPU and GPU attributes alphabetically.
>   - Break out the patch consolidating the driver name cost.
>   - Move some of the refactoring of attribute_id back to into patch 1
>     where it belongs.
>   - Fix some additional typos in function prototypes.
> v1: https://lore.kernel.org/platform-driver-x86/20260213081243.794288-1-d=
erekjohn.clark@gmail.com/
>=20
> Derek J. Clark (6):
>   platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
>   platform/x86: lenovo-wmi-other: Limit adding attributes to supported
>     devices
>   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
>   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
>   platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
>   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
>=20
>  .../wmi/devices/lenovo-wmi-other.rst          |  21 +
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  13 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 605 ++++++++++++++++--
>  4 files changed, 593 insertions(+), 47 deletions(-)
