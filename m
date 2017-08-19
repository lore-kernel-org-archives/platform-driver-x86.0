From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 2/3] platform/dell-wmi: Update
 dell_wmi_check_descriptor_buffer() to new model
Date: Fri, 18 Aug 2017 17:14:06 -0700
Message-ID: <20170819001406.GA27074@fury>
References: <cover.1501601667.git.luto@kernel.org>
 <e941330872d1a0811a390c80aa1fe817ec386d5f.1501601667.git.luto@kernel.org>
 <20170801154457.GB25574@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46949 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751077AbdHSAOI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 20:14:08 -0400
Content-Disposition: inline
In-Reply-To: <20170801154457.GB25574@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org

On Tue, Aug 01, 2017 at 05:44:57PM +0200, Pali Rohár wrote:
> On Tuesday 01 August 2017 08:37:27 Andy Lutomirski wrote:
> > This converts dell_wmi_check_descriptor_buffer() to the new driver
> > model interface and puts the interface version in dell_wmi_priv
> > where it belongs.
> > 
> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
> 
> Looks good,
> 
> Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

Queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center
