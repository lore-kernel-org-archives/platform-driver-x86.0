From: Robert Gerlach <khnz@gmx.de>
Subject: [PATCH 0/3] fujitsu-tablet patches for 3.4
Date: Tue,  3 Apr 2012 22:34:32 +0200
Message-ID: <1333485275-2752-1-git-send-email-khnz@gmx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.23]:48197 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751552Ab2DCUel (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Apr 2012 16:34:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id A23FB166A1
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:38 +0200 (CEST)
Received: from kolab.lan ([127.0.0.1])
	by localhost (kolab.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liYH0MdF7I5g for <platform-driver-x86@vger.kernel.org>;
	Tue,  3 Apr 2012 22:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id 8A00F166A3
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:37 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Robert Gerlach <khnz@gmx.de>

There are 2 trivial cleanups and 1 bugfix for the Fujitsu tablet extras driver.

Robert Gerlach (3):
  fujitsu-tablet: remove duplicated code
  fujitsu-tablet: convert printk to pr_*
  fujitsu-tablet: correct quirks for Lifebook and Stylistic tablets
