From: "Nathanael D. Noblet" <nathanael@gnat.ca>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Wed, 12 Sep 2012 22:35:02 -0600
Message-ID: <50516276.7010103@gnat.ca>
References: <502BD214.6090700@gnat.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-out-04.shaw.ca ([64.59.134.12]:52417 "EHLO
	smtp-out-04.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433Ab2IMEfF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 00:35:05 -0400
In-Reply-To: <502BD214.6090700@gnat.ca>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@novell.com, platform-driver-x86@vger.kernel.org

On 08/15/2012 10:45 AM, Nathanael D. Noblet wrote:
> Hello,
>
>    I recently purchased an Acer Aspire One (model A0275-0691). It has an
> elantech touchpad. As detailed in this bug:
> https://bugzilla.redhat.com/show_bug.cgi?id=848270 the acer-wmi driver
> has two issues on this device.
>
> #1) It is sending TOUCHPAD_TOGGLE and simultaneously changing state
> #2) It disables the touchpad at init

So I tested the patch provided here. 
https://bugzilla.redhat.com/show_bug.cgi?id=848270

It definitely allows the Fn+F7 key combo to toggle the use of the 
mousepad. Unfortunately the mousepad comes up disabled and is very much 
confusing the users using the device. Is there somewhere I should look 
for what is causing that? I don't mind helping to debug the issue at all 
I just don't know where to start.

Thanks,
-- 
Nathanael d. Noblet
t 403.875.4613
