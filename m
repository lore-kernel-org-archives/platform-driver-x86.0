From: Bernhard Froemel <bfroemel@gmail.com>
Subject: [PATCH v2 0/2] apple-gmux: Fixes related to 'Support for new hardware'
Date: Sat, 25 Aug 2012 10:26:45 +0200
Message-ID: <50388C45.6030707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:37182 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753893Ab2HYI0u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 Aug 2012 04:26:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, froemel@vmars.tuwien.ac.at

Hello,

it follows a refined version where thanks to Seth and his extensive x86
assembly knowledge my initial assumption about how Apple does byte
writes could be falsified. It appears that byte writes only failed
because the index protocol was not correctly followed in the read functions.

Cheers,
 Bernhard
