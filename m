Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE527C0015E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 16:05:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjHIQFH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 12:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjHIQFG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 12:05:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0ED1FCC
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 09:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691597105; x=1723133105;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pi7t4PbGVaYnbh1cSEWYTgnMgdYstsN8xRBJJMxfAiA=;
  b=lVHdNDBzBxCaMl1gG8U/LN3DvFFXb9H4RDjYAJ8asibO+Zz1cUwd5YwK
   4WePC4cPKU1YaO+IKLIOVh8u4oiEa1YrJezdnjp1h4PnsLHuJdl8qzKyi
   yLrPgJDcITHdMAifOLbC7UaMrUNA3ldfAYR6Yz4IE5Znuk2FwMlbw+z35
   xroK0eDMSX1ipgCqQIrW/Kd1q2/TLbzaSoqFbnzp7siQXbEGB+ucEkPqK
   SOXQPOdO2PnImkjLBk735Q+nOh2fQk/0d5IPyOAe/Y/JfVMeV722uTUfD
   RD+ONO6iA5l9nSGL2lXBBmph+izHtUD2pVV75TMDgLUiw+fLobLk9/Fn4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="361293670"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="361293670"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="801798552"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="801798552"
Received: from spandruv-desk1.amr.corp.intel.com ([10.209.6.213])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:05:05 -0700
Message-ID: <c32cebce5e394f155cf4ab9a678f530fb2cda3d6.camel@linux.intel.com>
Subject: [GIT PULL v2]: tools/power/x86/intel-speed-select pull request for
 6.6-rc1
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "frank.ramsay@hpe.com" <frank.ramsay@hpe.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Date:   Wed, 09 Aug 2023 09:05:04 -0700
In-Reply-To: <9994927f661f93289b9c4c78c7346cea93c8869a.camel@intel.com>
References: <9994927f661f93289b9c4c78c7346cea93c8869a.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Sorry, I have to update to fix a bugzilla issue from RedHat compared to
previous pull for memory frequency display.

Pull request for Intel Speed Select version v1.17:
Summary of changes:
- Fix display issue for cpu count for power domain !=3D 0
- Increase sockect count
- Preventing CPU 0 offline for kernel version 6.5 and later
- Error when number of CPUs requested more than 256 in one request

The base branch for these changes=20
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git
branch: review-hans

The following changes since commit
6f8972a02a6c103b67dc3a0ed9b1722943f65276:

  platform/x86: hp-bioscfg: Use kmemdup() to replace kmalloc + memcpy
(2023-08-07 13:36:20 +0200)

are available in the Git repository at:

  https://github.com/spandruvada/linux-kernel.git intel-sst

for you to fetch changes up to
2fff509adceb10f991b259c02ef2e096a89f075e:

  tools/power/x86/intel-speed-select: v1.17 release (2023-08-09
08:57:58 -0700)

----------------------------------------------------------------
Frank Ramsay (1):
      tools/power/x86/intel-speed-select: Support more than 8 sockets.

Srinivas Pandruvada (5):
      tools/power/x86/intel-speed-select: Fix CPU count display
      tools/power/x86/intel-speed-select: Error on CPU count exceed in
request
      tools/power/x86/intel-speed-select: Prevent CPU 0 offline
      tools/power/x86/intel-speed-select: Change mem-frequency display
name
      tools/power/x86/intel-speed-select: v1.17 release

 tools/power/x86/intel-speed-select/isst-config.c  | 51
+++++++++++++++++++++++++++++++++++++++++++++++++--
 tools/power/x86/intel-speed-select/isst-display.c |  2 +-
 tools/power/x86/intel-speed-select/isst.h         |  2 +-
 3 files changed, 51 insertions(+), 4 deletions(-)

Thanks,
Srinivas

On Tue, 2023-08-08 at 22:26 +0000, Pandruvada, Srinivas wrote:
> Hi Hans,
>=20
> Pull request for Intel Speed Select version v1.17:
> Summary of changes:
> - Fix display issue for cpu count for power domain !=3D 0
> - Increase sockect count
> - Preventing CPU 0 offline for kernel version 6.5 and later
> - Error when number of CPUs requested more than 256 in one request
>=20
> The base branch for these changes=20
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x8=
6.git
> branch: review-hans
>=20
> The following changes since commit
> 6f8972a02a6c103b67dc3a0ed9b1722943f65276:
>=20
> =C2=A0 platform/x86: hp-bioscfg: Use kmemdup() to replace kmalloc + memcp=
y
> (2023-08-07 13:36:20 +0200)
>=20
> are available in the Git repository at:
>=20
> =C2=A0 https://github.com/spandruvada/linux-kernel.git=C2=A0intel-sst
>=20
> for you to fetch changes up to
> 5abc392b38a1716d194c904c0f4f5aa201b0c0dd:
>=20
> =C2=A0 tools/power/x86/intel-speed-select: v1.17 release (2023-08-08
> 15:16:40 -0700)
>=20
> ----------------------------------------------------------------
> Frank Ramsay (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools/power/x86/intel-speed-select: Suppor=
t more than 8
> sockets.
>=20
> Srinivas Pandruvada (4):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools/power/x86/intel-speed-select: Fix CP=
U count display
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools/power/x86/intel-speed-select: Error =
on CPU count exceed
> in
> request
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools/power/x86/intel-speed-select: Preven=
t CPU 0 offline
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools/power/x86/intel-speed-select: v1.17 =
release
>=20
> =C2=A0tools/power/x86/intel-speed-select/isst-config.c | 51
> +++++++++++++++++++++++++++++++++++++++++++++++++--
> =C2=A0tools/power/x86/intel-speed-select/isst.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A02 files changed, 50 insertions(+), 3 deletions(-)
>=20
> Thanks,
> Srinivas

