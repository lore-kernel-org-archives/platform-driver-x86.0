From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Tue, 10 Oct 2017 21:11:30 +0200
Message-ID: <20171010191130.5octjwhbxouayxfv@pali>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:46311 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753395AbdJJTLf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 15:11:35 -0400
Content-Disposition: inline
In-Reply-To: <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

On Monday 09 October 2017 17:51:51 Mario Limonciello wrote:
> +	/* make sure we're not calling a higher instance than exists*/
> +	if (_IOC_NR(cmd) > wblock->gblock.instance_count - 1)
> +		return -EINVAL;

Is this condition really working? instance_count is unsigned, cmd is
also unsigned... and when instance_count is zero, then IIRC error would
not be thrown.

-- 
Pali Rohár
pali.rohar@gmail.com
