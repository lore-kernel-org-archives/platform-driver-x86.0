From: "Nathanael D. Noblet" <nathanael@gnat.ca>
Subject: Acer-WMI disables touchpad and other issues
Date: Wed, 15 Aug 2012 10:45:08 -0600
Message-ID: <502BD214.6090700@gnat.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from idcmail-mo2no.shaw.ca ([64.59.134.9]:12760 "EHLO
	idcmail-mo2no.shaw.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755868Ab2HOQpO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Aug 2012 12:45:14 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@novell.com, platform-driver-x86@vger.kernel.org

Hello,

   I recently purchased an Acer Aspire One (model A0275-0691). It has an 
elantech touchpad. As detailed in this bug: 
https://bugzilla.redhat.com/show_bug.cgi?id=848270 the acer-wmi driver 
has two issues on this device.

#1) It is sending TOUCHPAD_TOGGLE and simultaneously changing state
#2) It disables the touchpad at init

It should apparently be doing neither of those. If I boot with acer-wmi 
blacklisted the touchpad works perfectly, all other Fn+key combos work 
other than brightness control.


-- 
Nathanael d. Noblet
t 403.875.4613
