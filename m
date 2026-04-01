Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A121534107D;
	Wed,  1 Apr 2026 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775074474; cv=pass; b=TNHSPH2SeuNnK4UPJxdaAezgZpMAto1vHeVq+CWF/jbzA7/GvFNe+E7/lnBaCFGUSbDv8YdulESTOoJJKuWPNPClEOiPLLBSzlVS8bMRVcHrcP4G5lYDD7BvOIua6fTs83WxvBMD+/jKk4uYStTy5ceccqbmF2TlwL+6DoHKDgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775074474; c=relaxed/simple;
	bh=u53FERkgb8fULrZHPTtne7P3EzmTGbFMo1w3UFbUwsQ=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oKsL0eELCTYU3nFZ8waekHNutgKU2xreS0VdnNOXFf+emM/snGvvuTawL1WF4ymNm7R/PWRLjCoe1Lk/ivGRMOKIQGBZa2vkc+/uwBLgazQZbQPGI1UrjVpkiGQPH1WsnmdtpoOip2jQjNpIGiQZPEpUgzpQ5gevHDXI/weKvEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=O17ZCE+q; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="O17ZCE+q"
ARC-Seal: i=1; a=rsa-sha256; t=1775074460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Nj2LhSfnNWyDgi4cf7imjqP5NlEos0JYV9F7q7lWLpE8n06Hmh519yASRFXow/Q7iJXAMwV/C7vmbYUvkLCoTfoe5wSf0b+mlUnEkH9Z/b+1rvXHC/L63tQSopLkFyM5E194AsZr5mmpLrepM2bcr3nlty+c+ZC1biwxWlUydhI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775074460; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a/weuNYGdU1elbo6xYzmI07GnxkyIx/X/fO9rfnc9kY=; 
	b=gUh+ZBIhTlywuA9OBOPxldAhYbJBG1JoIbNh1UKj5jGMGyGBhR2DBiUVop8uwdCmXoR6yzxEkEt0TzY+O6NzAufH1ZmZjEYtxPcSqwuwojKYhCfdQaQDAOGNA7c5jNoZT9/toyihqp4FjTbQSn+4pBS85H8KijyZRZ15EGCMOrc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775074460;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=a/weuNYGdU1elbo6xYzmI07GnxkyIx/X/fO9rfnc9kY=;
	b=O17ZCE+qCvAE8CRHRYOZAysIkmmLWUzeR6ZdLLSTZJ8cbnvdWyK6la9OmKCy0THz
	soQnrOb2nWV8fS9uKVyyTv3ajFeMqllahigDfodQqXFBr1GcImjRvIEQa/YOX7gdQgM
	E++M9yHmQ5fJcExpBZTIt7yK1BVCaWy/Frojqk/U6qjY27qPKJOWeWNvrxcy00CF/cb
	yvdns8Ff7WdqsXnF9LuE8x1mE0JnFjOQKVWWlyjO1+Svgce2ruhN9AFHegJBsSjfh5P
	Msk5nciOlE4/Pqi0fTKCp8LoR/z6iyjUylVJ2dBeRVW2UanmLiD2e/zhJkaYTJyFqUk
	+XNFbdoyvQ==
Received: by mx.zohomail.com with SMTPS id 1775074458282192.21083958230713;
	Wed, 1 Apr 2026 13:14:18 -0700 (PDT)
Message-ID: <40117a0ca6b5bde292c38de24c8103352637f7b5.camel@rong.moe>
Subject: Re: [PATCH v6 00/13] platform-x86: lenovo-wmi: Add fixes and
 enhancement
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <9E0EF7A3-D695-414E-BB06-60C7F2FBEE5E@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <499fa3efd5be054ffdda77dd00ad4d8d3391e073.camel@rong.moe>
	 <9E0EF7A3-D695-414E-BB06-60C7F2FBEE5E@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 04:12:54 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Wed, 2026-04-01 at 12:37 -0700, Derek J. Clark wrote:
> On April 1, 2026 11:44:51 AM PDT, Rong Zhang <i@rong.moe> wrote:
> > Hi Derek,
> >=20
> > On Tue, 2026-03-31 at 18:11 +0000, Derek J. Clark wrote:
> > > This series adds many much needed features and fixes to the lenovo-wm=
i
> > > drivers.
> > >=20
> > > Patch 1 moves LWMI_FAN_DIV to be next to the rest of the fan attribut=
e
> > > defines in preparation for adding additional attrbiute macros. This i=
s
> > > so the attribute macros can all be in the same place in the file.
> > >=20
> > > Patch 2 cleans up tunable_attr_01 by removing an unused pointer and
> > > correctly assigning the members as u8 isntead of u32.
> > >=20
> > > Patch 3 fixes a bug when sending 32 bit arguments via WMI where the
> > > second value in the args struct was uninitialized.
> > >=20
> > > Patch 4 moves all gamezone enums from the gamezone header into the
> > > helpers header in preparation for the rest of the series.
> > >=20
> > > Patch 5 adds a function to make assigning attribute ID's for capdata
> > > cleaner and easier.
> > >=20
> > > Patch 6 addresses bugs where devices that don't support exposed
> > > attributes would still create the attribute, and also attempts to
> > > identify the correct capdata and set/get methods since some legacy
> > > interfaces don't use the custom mode in the method or capdata ID.
> > >=20
> > > Patch 7 adds the remaining CPU attributes that weren't previously
> > > exposed.
> > >=20
> > > Patch 8 adds GPU attributes.
> > >=20
> > > Patch 9 renames a name constant in preparation for patch 6.
> > >=20
> > > Patch 10 adds battery charge-type limiting when supported only by WMI=
, or
> > > when a module parameter to skip compatibility checks is set. The
> > > MODULE_PARM_DESC macro creates one check and two warnings in checkpat=
ch.
> > > I reviewed other examples from the kernel and I am following the same
> > > convention, so I left it as is.
> > >=20
> > > Patch 11 fixes a bug where the 'gamezone' and the 'other' drivers wer=
e
> > > incorrectly coupled in the Kconfig, leading to side effects under
> > > certain kernel configurations.
> > >=20
> > > Patch 12 adds a debugfs directory.
> > >=20
> > > Patch 13 adds a debugfs file for dumping capdata.
> > >=20
> > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >=20
> > The series LGTM except for some tiny issues. See my replies to the
> > corresponding patches.
> >=20
> > Sashiko.dev reports some potential issues in the series as well as some
> > existing bugs.
> >=20
> > https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%=
40gmail.com
> >=20
> > I've mentioned some in my reply to the corresponding patches. Besides, =
I
> > am going to talk about existing bugs here:
> >=20
> >=20
> > - tunable_attr_01 is a statically shared structure, but .dev is
> > overwritten each time when the master is bound, which violates
> > `.no_singleton =3D true'
> >=20
> > AFAIK no device in wild has multiple wmi-other instances so it should b=
e
> > safe for the time being.
> >=20
> > Fixing it will need numerous fundamental refactorings to the attributes
> > and conflict with patch 6 where .cd_mode_id and .cv_mode_id is added to
> > tunable_attr_01.
> >=20
> > I don't really want to make this series too large and miss this cycle.
> > Hence, I am going to fix it in the next cycle with some extra
> > refactorings to get rid of attribute-specific show/store callbacks.
>=20
> Might be good to collaborate on this. I wanted to add some callbacks & ma=
cros for BOOL type attributes and rename the current ATTR macro/callbacks t=
o specify U8 in the names.=20

Thanks. I will get in touch with you off-list when I finishes the PoC.
Probably in this week or next if I am not going to be very busy :)

>=20
> I also wanted to add fan curve settings with pwm_auto attributes for devi=
ces that support it soon, but that might be a big lift with such a large re=
factor going on. I personally prefer to alternate between bug fixing and fe=
ature adding per series/cycle if I can, this one just became a mix of both.

I understand your difficulties, as that's mostly my preference too. But
on the other hand, bug reports can't be ignored if it's legit and
reproducible.

I tried my best to make my fix patches tiny and easy to review. I hope
this is helpful.

>=20
> > For this series, I'd consider violating `.no_singleton =3D true' a very
> > minor concern. It should be fine to keep it as is. If we really care
> > about it, we could set it to false temporarily.
> >=20
>=20
> I'll leave it for now unless Ilpo or Armin specifically want it changed.=
=20
>=20
> > - Rebinding wmi-other leaks IDA
> >=20
> > - Failure in lwmi_om_fw_attr_add() followed by lwmi_other_remove()
> > double frees the same IDA
> >=20
> > - Calling lwmi_dev_evaluate_int() with `retval =3D=3D NULL' leaks memor=
y
> >=20
> > - Unbalanced component bind and unbind in the error path of
> > lwmi_om_master_bind()
> >=20
> > Legit concerns. I will reply with a series fixing them. Could you
> > incorporate it into your series?
> >=20
> > Fix patches should be the very first patches in the series so that
> > backporting is less painful. I'd suggest rearranging the series like:
> >=20
> > patches in my fix series
> > patch 3
> > patch 4
> > patch 11
> > the rest patches
> >=20
>=20
> Sounds good. I'll try to get those changes incorporated and sent out toda=
y. This series is getting out of hand as it is (from 5 to 16 patches now) s=
o putting it to bed is high on my priority list.

I also hope the dust settles soon. Thanks a lot for your great efforts
and patience -- they are priceless.

Thanks,
Rong

>=20
> Thanks,=20
>=20
> Derek
> > Thanks,
> > Rong
> >=20
> > > ---
> > > v6:
> > >   - Incorporate Rong Zhang's debugfs and decoupling patches into the
> > >     series.
> > >   - Add a patch to clean up too many cross-references to wmi-gamezone=
.h
> > >   - Make lwmi_attr_id a static inline in wmi-capdata.h
> > >   - Added a patch  to fix a bug where ares.arg1 is uninitialized when=
 it
> > >     is sent to the firmware.
> > >   - Add supported checks before adding battery extenstion, and ensure
> > >     both the new checks and the is_writable checks are not casting u3=
2
> > >     to i32.
> > >   - Misc formating changes.
> > > v5: https://lore.kernel.org/platform-driver-x86/20260324221032.133363=
6-1-derekjohn.clark@gmail.com/
> > >   - Remove cv/cd_mode_id references that occured before patch 4.
> > >   - Move lwmi_attr_id to capdata.c with a namespace export.
> > >   - Fix mixing include.
> > >   - Make lwmi_attr_is_supported return bool.
> > >   - Use switch instead of if for setting/getting charge type state.
> > >   - Various formatting fixes.
> > > v4: https://lore.kernel.org/platform-driver-x86/20260312031032.346756=
5-1-derekjohn.clark@gmail.com/
> > >   - Use loop instead of back gotos for identifying the working attrib=
ute
> > >     ID.
> > >   - Use function instead of macro to assign attribute_id, preserving
> > >     types.
> > >   - Removed unused defines and enum values.
> > >   - Rename charging defines to clarify thier purpose.
> > >   - Fixed various formatting issues from v3.
> > >   - Added module param to skip ACPI check when loading the driver for
> > >     the power supply extension.
> > >   - Don't abort adding power supply extension if the ACPI handle from
> > >     ideapad is not present.
> > >   - Don't worry about symmetric cleanup when cleaning up attributes i=
n
> > >     an error state.
> > >   - Reword Patch 8 commit message to be more concise.
> > >   - Fix wording in Patch 7 to match the changes.
> > > v3: https://lore.kernel.org/platform-driver-x86/20260224043200.268038=
4-1-derekjohn.clark@gmail.com/
> > >   - Re-add HWMON name const and just rename LWMI_OM_FW_ATTR_BASE_PATH
> > >   - Fix linker warnings by moving acpi/battery include to the end of =
the
> > >     list.
> > >   - Remove CPU/GPU OC features. These attributes are BOOL type and wi=
ll
> > >     need a new constructor that I'll add later.
> > > v2: https://lore.kernel.org/platform-driver-x86/20260215061339.284248=
6-1-derekjohn.clark@gmail.com/
> > >   - Fix gpu_mode misisng from attributes list.
> > >   - Fix prototypes for power suppy patch.
> > >   - Reorganize CPU and GPU attributes alphabetically.
> > >   - Break out the patch consolidating the driver name cost.
> > >   - Move some of the refactoring of attribute_id back to into patch 1
> > >     where it belongs.
> > >   - Fix some additional typos in function prototypes.
> > > v1: https://lore.kernel.org/platform-driver-x86/20260213081243.794288=
-1-derekjohn.clark@gmail.com/
> > >=20
> > >=20
> > > Derek J. Clark (10):
> > >   platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
> > >   platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
> > >   platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
> > >   platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helper=
s
> > >   platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
> > >   platform/x86: lenovo-wmi-other: Limit adding attributes to supporte=
d
> > >     devices
> > >   platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
> > >   platform/x86: lenovo-wmi-other: Add GPU tunable attributes
> > >   platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
> > >   platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
> > >=20
> > > Rong Zhang (3):
> > >   platform/x86: lenovo: Decouple lenovo-wmi-gamezone and
> > >     lenovo-wmi-other
> > >   platform/x86: lenovo-wmi-helpers: Add helper for creating per-devic=
e
> > >     debugfs dir
> > >   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capd=
ata
> > >=20
> > >  .../wmi/devices/lenovo-wmi-other.rst          |  19 +
> > >  drivers/platform/x86/lenovo/Kconfig           |   3 +-
> > >  drivers/platform/x86/lenovo/wmi-capdata.c     | 128 +++-
> > >  drivers/platform/x86/lenovo/wmi-capdata.h     |  31 +-
> > >  drivers/platform/x86/lenovo/wmi-events.c      |   2 +-
> > >  drivers/platform/x86/lenovo/wmi-gamezone.c    |   5 +-
> > >  drivers/platform/x86/lenovo/wmi-gamezone.h    |  20 -
> > >  drivers/platform/x86/lenovo/wmi-helpers.c     | 136 ++++
> > >  drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
> > >  drivers/platform/x86/lenovo/wmi-other.c       | 689 ++++++++++++++--=
--
> > >  drivers/platform/x86/lenovo/wmi-other.h       |  16 -
> > >  11 files changed, 891 insertions(+), 181 deletions(-)
> > >  delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
> > >  delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h
