Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0B3F23B5;
	Wed, 25 Mar 2026 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462475; cv=pass; b=Trl68F8gQcZ3NXtZOfUqTAeHGdEFv5Oq7ShKNxb99x6Fm+lbiuYCYDe4lWWwz/z5npwLCVSZnrgPewagTEsLVq1eMqOoFjuS/pimm340yZ5OQLnrzFD4Bf85x1E8b1HbBaTXERN9C36mb8XzRmuuvblkEWoEl9kg3qJSoxjkpJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462475; c=relaxed/simple;
	bh=x3jlEgh0Rj/NtmJ8oQ65fJRKhI+IXsnFSOj42UR9Euo=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sNQtMB+UBF1bmzLUUQjqGy3kZbj8ZTUuiUA12Cqyka3xhoaKT7gUn1Sfj//458RyPQRxFchGibuaf6L98ABdffD9DWHWjN/EognCv2map0+7Qy/oZxAVwCZLlGS3UX/hbYLWnIdWknydj6EP94KtRZJccPuoSRSb/m5As8rnPgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=mFn9PNuj; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="mFn9PNuj"
ARC-Seal: i=1; a=rsa-sha256; t=1774462465; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ynxo632oeBENaGpBLf00GrOAFFZ+xMZJX+Uvg3/RbYrrmBXhWAIZv0RG0W43VPuIwXf+lswQjpBLnU1/qGJHbhhFxoqTHb7oE7BWTG/OnyXJ0rYc9wDiGv+Sm2KLxAA03X7ayG4cN16xqXL4XaEFb34JdVj51T20BdDJwoBDovE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774462465; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UhL+JKDbGY1Nki9cm/TRLPVspwl2BuGmXiiXS4HXJuY=; 
	b=j9Fbe1jwObdK9uHtYpwjeQpQ9xM6FnJBnSLnnTcci4+3T9bY+MO3yhkQn+0T1F+1G1bWXWmQaHHJeWuKRZmpslH13F+5+HumGKNGKd7agIFOa7LrUZ/Y/zhHDQ81PEim5s94e7mxaO8DbXgFnB2YJKGFvLQEDLXY1XaeekDxqcU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774462464;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=UhL+JKDbGY1Nki9cm/TRLPVspwl2BuGmXiiXS4HXJuY=;
	b=mFn9PNuj2lGbPHNRbgdOa9SIThi2Hp8zgO+Zw3NlGAPoq2Dpq9q7g2a3vED9+9/0
	8HHsAZuszFGaFxLLKZRNennOYTby5ZeDH2cDRdwSv7LkLVnx3dtPsTo38e/Q06sQnWQ
	W4tXdBgImG2AAnYXFDyQN0Jah71fMblJdueOf+9XAlTxp7Gipd5xLRnUQVs5DtDYKK3
	+l+ytSN1K8n3zK5rooX0POy5w1gehBHQJHx8aoRdFzUiLPPpXTRjIO6JBJsRgtz+6pG
	VNJ9JLAPseaeQPX9vCYiaH5RgnTx6xaKiPVLZnGG4j9E1lMOUstYZEnP976sYgjK7ES
	hjaduREpEw==
Received: by mx.zohomail.com with SMTPS id 1774462462452379.7614544269495;
	Wed, 25 Mar 2026 11:14:22 -0700 (PDT)
Message-ID: <37e6875b6a6f06869a2c3bfcc67579d394d7bda7.camel@rong.moe>
Subject: Re: [PATCH v5 0/8] platform-x86: lenovo-wmi: Add fixes and
 enhancement
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Mar 2026 02:08:34 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

There are typos in the patch titles (this and subsequent patches).

s#platform-x86#platform/x86#g

On Tue, 2026-03-24 at 22:10 +0000, Derek J. Clark wrote:
> This series adds many much needed features and fixes to the lenovo-wmi
> drivers.
>=20
> Patch 1 moves LWMI_FAN_DIV to be next to the rest of the fan attribute
> defines in preparation for adding additional attrbiute macros. This is
> so the attribute macros can all be in the same place in the file.
>=20
> Patch 2 cleans up tunable_attr_01 by removing an unused pointer and
> correctly assigning the members as u8 isntead of u32.
>=20
> Patch 3 adds a function to make assigning attribute ID's for capdata
> cleaner and easier.
>=20
> Patch 4 addresses bugs where devices that don't support exposed
> attributes would still create the attribute, and also attempts to
> identify the correct capdata and set/get methods as some legacy
> interfaces don't use the custom mode in the method or capdata ID.
>=20
> Patch 5 adds the remaining CPU attributes that weren't previously
> exposed.
>=20
> Patch 6 adds GPU attributes.
>=20
> Patch 7 renames a name constant in preparation for patch 6.
>=20
> Patch 8 adds battery charge-type limiting when supported only by WMI, or
> when a module parameter to skip this check is set. The MODULE_PARM_DESC
> macro creates one check and two warnings in checkpatch. I reviewed other
> examples from the kernel and I am following the same convention, so I
> left it as is.
>=20
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

The series LGTM generally, thanks!

There are some tiny issues though, see my replies to the corresponding
patches.

With them fixed, for the whole series:

Reviewed-by: Rong Zhang <i@rong.moe>

My device doesn't support any CPU, GPU or PSU attributes, so for patch
1-4 and 7:

Tested-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
> v5:
>   - Remove cv/cd_mode_id references that occured before patch 4.
>   - Move lwmi_attr_id to capdata.c with a namespace export.
>   - Fix mixing include.
>   - Make lwmi_attr_is_supported return bool.
>   - Use switch instead of if for setting/getting charge type state.
>   - Various formatting fixes.
> v4: https://lore.kernel.org/platform-driver-x86/20260312031032.3467565-1-=
derekjohn.clark@gmail.com/
>   - Use loop instead of back gotos for identifying the working attribute
>     ID.
>   - Use function instead of macro to assign attribute_id, preserving
>     types.
>   - Removed unused defines and enum values.
>   - Rename charging defines to clarify thier purpose.
>   - Fixed various formatting issues from v3.
>   - Added module param to skip ACPI check when loading the driver for
>     the power supply extension.
>   - Don't abort adding power supply extension if the ACPI handle from
>     ideapad is not present.
>   - Don't worry about symmetric cleanup when cleaning up attributes in
>     an error state.
>   - Reword Patch 8 commit message to be more concise.
>   - Fix wording in Patch 7 to match the changes.
> v3: https://lore.kernel.org/platform-driver-x86/20260224043200.2680384-1-=
derekjohn.clark@gmail.com/
>   - Re-add HWMON name const and just rename LWMI_OM_FW_ATTR_BASE_PATH
>   - Fix linker warnings by moving acpi/battery include to the end of the
>     list.
>   - Remove CPU/GPU OC features. These attributes are BOOL type and will
>     need a new constructor that I'll add later.
> v2: https://lore.kernel.org/platform-driver-x86/20260215061339.2842486-1-=
derekjohn.clark@gmail.com/
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
> Derek J. Clark (8):
>   platform-x86: lenovo-wmi-other: Move LWMI_FAN_DIV
>   platform-x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
>   platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
>   platform/x86: lenovo-wmi-other: Limit adding attributes to supported
>     devices
>   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
>   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
>   platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
>   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
>=20
>  .../wmi/devices/lenovo-wmi-other.rst          |  19 +
>  drivers/platform/x86/lenovo/Kconfig           |   1 +
>  drivers/platform/x86/lenovo/wmi-capdata.c     |  25 +-
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  10 +-
>  drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 586 ++++++++++++++++--
>  6 files changed, 596 insertions(+), 46 deletions(-)
