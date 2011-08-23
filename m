From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bugme-new] [Bug 40582] New: acer_wmi kernel module is prevent
 of correct work of Acer AO 721
Date: Tue, 23 Aug 2011 14:29:34 -0700
Message-ID: <20110823142934.fc47eb32.akpm@linux-foundation.org>
References: <bug-40582-10286@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:39242 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752183Ab1HWVaH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Aug 2011 17:30:07 -0400
In-Reply-To: <bug-40582-10286@https.bugzilla.kernel.org/>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Joey Lee <jlee@novell.com>
Cc: bugme-daemon@bugzilla.kernel.org, runetmember@gmail.com


(switched to email.  Please respond via emailed reply-to-all, not via the
bugzilla web interface).

On Fri, 5 Aug 2011 09:02:45 GMT
bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=40582
> 
>            Summary: acer_wmi kernel module is prevent of correct work of
>                     Acer AO 721
>            Product: ACPI
>            Version: 2.5
>     Kernel Version: 2.6.38
>           Platform: All
>         OS/Version: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Config-Tables
>         AssignedTo: acpi_config-tables@kernel-bugs.osdl.org
>         ReportedBy: runetmember@gmail.com
>         Regression: Yes
> 
> 
> Created an attachment (id=67622)
>  --> (https://bugzilla.kernel.org/attachment.cgi?id=67622)
> Decompiled DSDT table
> 
> acer_wmi kernel module is prevent of correct work of Acer Aspire one 721-148ss.
> For example if this kernel module is loaded it's not possible to enable WiFi.
> First bugreport here: https://bugs.launchpad.net/bugs/791373
> Blacklisting of acer_wmi solve this problem. So probably acer_wmi is doesn't
> support of Acer AO 721 (or have support, but this support is buggy).
> 
> I also want to note, with 2.6.35 kernel I have only one problem with acer_wmi
> https://bugs.launchpad.net/bugs/683979 (it's not my bugreport, but I have
> exactly same problem with 2.6.35 kernel on Acer AO 721).
> 
> Decompiled DSDT table of Acer Aspire one 721-148ss attached.
> 
