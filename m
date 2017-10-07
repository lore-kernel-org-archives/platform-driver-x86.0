From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v5 14/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Sat, 7 Oct 2017 09:43:58 +0200
Message-ID: <20171007074358.GA26939@kroah.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <cb39307b0d44321cb168331c308e0fbee11b385c.1507350554.git.mario.limonciello@dell.com>
 <20171007074132.GB25755@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34109 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750990AbdJGHnu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 03:43:50 -0400
Content-Disposition: inline
In-Reply-To: <20171007074132.GB25755@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Sat, Oct 07, 2017 at 09:41:32AM +0200, Greg KH wrote:
> And I still didn't see where you were verifying the list of commands in
> this structure, was that in some other patch?

Oh nevermind, that was a different patch, found it...
