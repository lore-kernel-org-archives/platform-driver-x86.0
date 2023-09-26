Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF415E7F152
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 02:12:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbjI0CMK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 22:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235643AbjI0CKA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 22:10:00 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B218F19EBF;
        Tue, 26 Sep 2023 16:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695772288; x=1727308288;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=l1MnRZTCkdDT1feG/R3+JF8zA5DmkeL6LdNzGpJKWL8=;
  b=agp14OBGlhRzBOvhdCJD7H4+nsaaeh2UP/FVDihbRvtQN56UYW/mS6z2
   HZ1e87g+U7MoY7DbQwKqEhWvo2LTWfjfzJTAbf0Pro8hSCsUEHCvUzuld
   g7qGAYC/Hri8mYcoG2lYXJ/u0lga15xoCaP75Zp9bJ3SsxMKma41FnrOP
   m4bgQcZeusf3SAIGFY0ylUko802FwExnmzFb7ed6TJCYQru8X/IG8Cjl6
   t4x72T0RkYMyen6JmcSFvD0iJ2TMpqoQCcGK0vEma0YEpqQaip+iZn8uz
   I+cbYvPLlOb3h6ziGN555jQyTIb7XPfyjDTgXTpUGJYNg8fB+GMqu3b9I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385546667"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="385546667"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 16:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="725604764"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="725604764"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 16:51:14 -0700
Received: from rabakare-mobl3.amr.corp.intel.com (unknown [10.212.145.15])
        by linux.intel.com (Postfix) with ESMTP id AA7F1580BBE;
        Tue, 26 Sep 2023 16:51:14 -0700 (PDT)
Message-ID: <d4823817e907527119f7bb7fb7a4f77e8ce4dcc5.camel@linux.intel.com>
Subject: Re: [PATCH 01/11] platform/x86/intel/vsec: Add intel_vsec_register
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, rajvi.jingar@linux.intel.com
Date:   Tue, 26 Sep 2023 16:51:14 -0700
In-Reply-To: <1ed7ddc8-18a-cfbc-a4cd-baaa5751493e@linux.intel.com>
References: <20230922213032.1770590-1-david.e.box@linux.intel.com>
         <20230922213032.1770590-2-david.e.box@linux.intel.com>
         <1ed7ddc8-18a-cfbc-a4cd-baaa5751493e@linux.intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

Thanks for reviewing.

On Tue, 2023-09-26 at 17:17 +0300, Ilpo J=C3=A4rvinen wrote:
> On Fri, 22 Sep 2023, David E. Box wrote:
>=20
> > From: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> >=20
> > Add and export intel_vsec_register() to allow the registration of Intel
> > extended capabilities from other drivers. Add check to look for memory
> > conflicts before registering a new capability.
> >=20

...

>=20
> Please split this patch properly. I see at least 3 components (some of=
=20
> which were not even mentioned in the changelog):
>=20
> - Moving enum, struct & defines (no functional changes intended patch)
> - Moving quirks to new place
> - The rest
>=20

Will split up the patch.
