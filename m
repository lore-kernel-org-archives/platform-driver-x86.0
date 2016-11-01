From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/2] ABI: ibm_rtl: the "What:" fields are incomplete
Date: Tue, 1 Nov 2016 09:15:03 -0700
Message-ID: <20161101161503.GA3215@f23x64.localdomain>
References: <364a36215c44e0c2785911e9d9259cd866283cb9.1477735797.git.mchehab@s-opensource.com>
 <650a057df924aff3b70a445694fcb1e3af524c8d.1477735797.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57737 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750833AbcKAQNs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2016 12:13:48 -0400
Content-Disposition: inline
In-Reply-To: <650a057df924aff3b70a445694fcb1e3af524c8d.1477735797.git.mchehab@s-opensource.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Vernon Mauery <vernux@us.ibm.com>, platform-driver-x86@vger.kernel.org

On Sat, Oct 29, 2016 at 08:10:03AM -0200, Mauro Carvalho Chehab wrote:
> The "What:" field at the ABI should describe the location of
> the ABI, e. g. the position under a mounted sysfs. However,
> this file has only the basename without the path.
> 
> Fix it.
> 
> Cc: Vernon Mauery <vernux@us.ibm.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>

Thanks, applied.

-- 
Darren Hart
Intel Open Source Technology Center
