From: John Dahlstrom <jodarom@SDF.ORG>
Subject: Re: [PATCH v4 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Sat, 27 Feb 2016 00:49:03 -0600 (CST)
Message-ID: <Pine.NEB.4.64.1602261748330.4769@norge.freeshell.org>
References: <Pine.NEB.4.64.1602191918380.15324@faeroes.freeshell.org>
 <20160222221416.GD14101@dvhart-mobl5.amr.corp.intel.com>
 <Pine.NEB.4.64.1602221810140.9397@norge.freeshell.org>
 <20160226185622.GA21870@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx.sdf.org ([192.94.73.23]:61977 "EHLO sdf.lonestar.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753481AbcB0GuF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Feb 2016 01:50:05 -0500
In-Reply-To: <20160226185622.GA21870@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 26 Feb 2016, Darren Hart wrote:
> On Mon, Feb 22, 2016 at 10:29:48PM -0600, John Dahlstrom wrote:
[...]
>> Thank you for that information. One commit is sufficient to apply the patch
>> to all kernel versions without fuzz:
>>
>> 4fa9dab ideapad_laptop: Lenovo G50-30 fix rfkill reports wireless blocked
>
> This does not yield correct results for me on 3.17 (or 3.17.8). Do you get
> different results from the following?
>
[...]
> Note that the DMI match blocks were stuffed in the middle of the
> ideapad_acpi_add() function instead of the no_hw_rfkill.

The v3, v4, and v5 patch submissions had been corrupted by spurious
whitespace inserted by my email client. I have sent a corrected version,
[PATCH v6 1/1] ideapad-laptop: Add ideapad Y700 (15) to the no_hw_rfkill DMI list

After submission, I verified the successful application of the patch
as received by the mailing list.

I also ran git clone, "git checkout -b 3.17 v3.17", and
"git cherry-pick 4fa9dab", followed by patch with success.

Kind regards,

John
