Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074ECC7EE29
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Jun 2023 14:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236548AbjFHOe0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Jun 2023 10:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236555AbjFHOeZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jun 2023 10:34:25 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C362D5F;
        Thu,  8 Jun 2023 07:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686234863; x=1717770863;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=uiyRflW2DcL6v5LUsRW2wwj6z/c4EWtpZY1yotoGTtE=;
  b=kQOXq+8VrU0+bjD0npSAdM9BIjO7T20VUAJIuLIdgwVhjkJrLb0AZpfZ
   n8t/yv9BVnp9kDRY2ZDgZBHqkcRB10qwn0iZcUt3HXX1uo4d5dkvqEnl/
   xYFmmQFPkt0/cM5oYYGvMcrdGefdz7SlOyJpFNKbBqrp2deXsMYHmnKuM
   ZTheGosdjPDOFnTcjsrDVyRqzYL20AoJRH1mjZAKq2n1TovrTLN6Pj4LU
   ejGLYnoSUCmEQ6dg3XPSwotx9oKF8txHGBvHT0JOyrSD57B5RvfOykzQv
   VT+9Kqxmqnpw8Ju4OkxfCXjC0Mz9X3HMLPKvDYxzhMPZub92vBD8LV/LK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="359802737"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="359802737"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 07:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="854374323"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="854374323"
Received: from moleneva-mobl1.ccr.corp.intel.com ([10.251.211.109])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 07:34:20 -0700
Date:   Thu, 8 Jun 2023 17:34:18 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     "David E. Box" <david.e.box@linux.intel.com>
cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, markgross@kernel.org,
        hdegoede@redhat.com, irenic.rajneesh@gmail.com,
        xi.pardee@intel.com, rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V2 1/2] platform/x86/intel/pmc: Add resume callback
In-Reply-To: <20230607233849.239047-1-david.e.box@linux.intel.com>
Message-ID: <31357bb1-7238-2c88-1d40-52fff2d4c21@linux.intel.com>
References: <20230607233849.239047-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-824212765-1686234818=:1997"
Content-ID: <d39b1e7-bce2-1c37-938f-6fc0178c069@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-824212765-1686234818=:1997
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <8cf23d98-1390-6a81-ad96-6c2641b87a4e@linux.intel.com>

On Wed, 7 Jun 2023, David E. Box wrote:

> Add a resume callback to perform platform specific functions during resume
> from suspend.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.
--8323329-824212765-1686234818=:1997--
