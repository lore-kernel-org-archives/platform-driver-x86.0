From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH resend 5/6] toshiba_acpi: Add support to enable/disable
 USB 3
Date: Tue, 10 Feb 2015 05:24:56 +0000
Message-ID: <20150210052456.GA19985@srcf.ucam.org>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
 <1423539294-2941-6-git-send-email-coproscefalo@gmail.com>
 <20150210041138.GC37927@fury.dvhart.com>
 <CAGdLNWGvqcTX09_kqZWScJFj96+L3=kjKE1d0aQKnQ_wrawazQ@mail.gmail.com>
 <20150210045552.GF37927@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:59326 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751564AbbBJFZM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Feb 2015 00:25:12 -0500
Content-Disposition: inline
In-Reply-To: <20150210045552.GF37927@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Azael Avalos <coproscefalo@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Len Brown <len.brown@intel.com>

On Mon, Feb 09, 2015 at 08:55:52PM -0800, Darren Hart wrote:

> I'd welcome the thoughts of the previous maintainers as to whether we want to
> include these kinds of OS-parity changes in the kernel. I'm probably leaning
> toward taking them.

The only real thing is whether there's any way to create a generic 
interface for it. In this case, I suspect not and that this is fine.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
