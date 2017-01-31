From: Jonathan Woithe <jwoithe@just42.net>
Subject: [PATCH 0/4][RFC v2] fujitsu-laptop: fujitsu-laptop: clean ups from
 Alan Jenkins
Date: Tue, 31 Jan 2017 23:37:41 +1030
Message-ID: <20170131130741.GA6218@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52674 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751964AbdAaNIT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2017 08:08:19 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kernel@kempniu.pl
Cc: platform-driver-x86@vger.kernel.org

This series of patches for the fujitsu-laptop driver was originally
submitted by Alan Jenkins in September 2009.  For various reasons which are
entirely my fault they were never acted upon.  To remedy this they have been
ported to the linux-platform-drivers-x86 git tree and compile-tested. 
Consequently this submission is a work in progress and is posted for
comments and feedback.

The patches are against git://git.infradead.org/linux-platform-drivers-x86.git
