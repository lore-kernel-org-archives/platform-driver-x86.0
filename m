Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9125AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 11:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbjKNLLL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 06:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjKNLLL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 06:11:11 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4A9191
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 03:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699960268; x=1731496268;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JTx5vNWjwHsNEpeN46mOBGm24hMnJycXVOQXwsEoLCI=;
  b=R5YSkdR77n7lnKiXrTYP1AdcPuzp+UIdkzjh1+kau4iftKzjbD3Crfst
   q3eeLMk2aeP7o099pnm3hmX/CnQGc7aZ8m7ii/Q1F/qLk/haqlOuzApX9
   lfKd1ATOvikMUYeJ5ew6D7LnjBNU+Rbdq6hKm8+j+fYU3uAODbM+duwt0
   PoydP34qd5klXLcuZMPPLjZR8i0Jcb7Q7ggjp/6+zpglHvZ5HVztO/oFu
   fMP1G5xtLfUvrn3GAvUALv0MABYDyJ0R7e/IE3E6ePHpCYs0kUWyIv2D9
   Ut+B0U+ucrOCWn4VRK8fcLTNX9zsWW898aj/cHqZZenyaOXud+3XTv+Ih
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421732539"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="421732539"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:11:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="5989895"
Received: from rauhjoha-mobl2.ger.corp.intel.com ([10.251.217.194])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:11:06 -0800
Date:   Tue, 14 Nov 2023 13:11:03 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Jules Irenge <jbi.octave@gmail.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        vadimp@nvidia.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/mellanox: mlxbf-tmfifo: Remove unnecessary
 bool conversion
In-Reply-To: <42dad56-f73a-cfcf-eedb-60412eb6a7e4@linux.intel.com>
Message-ID: <9c345f3-872-a15e-6adb-2d39ca999b@linux.intel.com>
References: <ZUWIIKbz4vukl8qb@octinomon> <42dad56-f73a-cfcf-eedb-60412eb6a7e4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2003022363-1699960267=:1748"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2003022363-1699960267=:1748
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 14 Nov 2023, Ilpo Järvinen wrote:

> On Fri, 3 Nov 2023, Jules Irenge wrote:
> 
> > This commit fixes coccinelle warning in macro function
> > IS_VRING_DROP() which complains conversion to bool not needed here.
> > 
> > Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Not an end of the world but just in case you have it stored somewhere, my 
> email address was lacking the first letter in your post.

Hi again,

I also realized right after send the reply that this is marked as 2/3 but 
the other two patches didn't make it into lore archives (nor into 
patchwork, I think).

-- 
 i.

--8323329-2003022363-1699960267=:1748--
