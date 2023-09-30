Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A84E77372
	for <platform-driver-x86@archiver.kernel.org>; Sat, 30 Sep 2023 12:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjI3Msp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Sep 2023 08:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjI3Mso (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Sep 2023 08:48:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C8A99;
        Sat, 30 Sep 2023 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696078123; x=1727614123;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=X8WsV/ZRbvpkRX48ByoJd0nz2IxLkux8cCcs6GQqY/8=;
  b=TbGgYU8nb40B4c6MQPWi4FJsMTE0ZPoEAsN05dkiLHcc1hRSqi3HHVoz
   +eZKTzM2nO/1BHMtej27/qngw5qENztNwRXy5iK7jjUnu1M6JUHabHnoC
   jnXjdQTAII/GxvstJDrK0JHAv+mEsiBR0lhdp7WWfHLe35+cPF/4y+jVN
   uyl7CUQIdIGQ8pwxPARApuAqJFtEUgmcWwyO6bStIMON3jist7Mt0MrtL
   jZsZaUweYUYTmHTt2QBQR4RFAc2YC8CIS0OP8g9lxscH1ObPopEValWHN
   WCkUWmY9NKEz05zVIhIVkGM9rlS3HFukskiNHHrZ3ZMCauFRZzhOuybso
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="4017029"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="4017029"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 05:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="699900396"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="699900396"
Received: from spandruv-desk.jf.intel.com (HELO spandruv-desk.amr.corp.intel.com) ([10.54.75.14])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 05:48:42 -0700
Message-ID: <7dd52e2438d3c401a123e483adc5d881579d545d.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] platform/x86: ISST: Use fuse enabled mask instead
 of allowed levels
From:   srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Date:   Sat, 30 Sep 2023 05:48:42 -0700
In-Reply-To: <6991c0fa-7b3c-b99a-4ac4-9c499d4d808b@linux.intel.com>
References: <20230925194555.966743-1-srinivas.pandruvada@linux.intel.com>
         <20230925194555.966743-2-srinivas.pandruvada@linux.intel.com>
         <6991c0fa-7b3c-b99a-4ac4-9c499d4d808b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-3.fc36) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 2023-09-29 at 15:14 +0300, Ilpo J=C3=A4rvinen wrote:
> On Mon, 25 Sep 2023, Srinivas Pandruvada wrote:
>=20
> > Allowed level mask is a mask of levels, which are currently allowed
> > to dynamically switch. But even dynamic switching is not allowed,
>=20
> even if ?
OK

>=20
> > user should be able to check all parameters for selection via BIOS.
>=20
> I think you're lacking a negation in the above paragraph because it
> sounds=20
> like there's an internal contradiction in it. Can you please take a
> look.

I can try to improve.

>=20

