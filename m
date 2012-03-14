From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Lenovo machines
Date: Wed, 14 Mar 2012 15:02:51 -0700
Message-ID: <20120314220251.GB14166@kroah.com>
References: <1327546404.15260.18.camel@linux-s257.site>
 <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
 <20120314215327.GA1510@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:42811 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031080Ab2CNWCz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 18:02:55 -0400
Received: by dadp12 with SMTP id p12so3583635dad.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Mar 2012 15:02:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20120314215327.GA1510@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: stable@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, joeyli <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>, Andrey <andrey.k.p@gmail.com>

On Wed, Mar 14, 2012 at 04:53:27PM -0500, Jonathan Nieder wrote:
> Hi Greg,
> 
> Please consider applying 461e74377cfc (acer-wmi: No wifi rfkill on
> Lenovo machines, 2012-02-03) to the 3.2.y and 3.0.y trees.

Now applied.

greg k-h
